
function price (){
 const itemPrice  = document.getElementById("item-price");
 itemPrice.addEventListener("input", () => {
   const inputNum = itemPrice.value;

   const fee = document.getElementById("add-tax-price");
   feeNum = (Math.floor(inputNum * 0.1));
   fee.innerHTML = feeNum;

   const salesProfit= document.getElementById("profit");
   salesProfit.innerHTML = (Math.floor(inputNum - feeNum));

 });
}

window.addEventListener('load',price);
