class CreditAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :house_number, :house_name, :phone_number,:item.id, :current_user.id
# ここにバリデーションの処理を書く
   with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  
   end
   validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
       # 寄付情報を保存し、変数donationに代入する
       # 住所を保存する
       # donation_idには、変数donationのidと指定する
       Buyer.create(item:id)
       Address.create(post_code: post_code, house_number: house_number, house_name: house_name, phone_number: buyer.create(user: current_user.id, item: id)
       Address.create(post_code: post_code, area: area, city: city, house_number: house_number, house_name: house_name,buyer_id: buyer_id)#donation_id: donation.id)
  end
end
