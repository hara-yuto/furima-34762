const pay = () => {
  Payjp.setPublicKey("");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("credit_address[number]"),
      exp_month: formData.get("credit_address[exp_month]"),
      exp_year: `20${formData.get("credit_address[exp_year]")}`,
      cvc: formData.get("credit_address[cvc]"),
 
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("credit_address_number").removeAttribute("name");
      document.getElementById("credit_address_cvc").removeAttribute("name");
      document.getElementById("credit_address_exp_month").removeAttribute("name");
      document.getElementById("credit_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit()
    });
  });
};

window.addEventListener("load", pay);