class CreditAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :house_number, :house_name, :phone_number,:item_id,:user_id

   with_options presence: true do
     validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
     validates :house_number
     validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}  
   end
   validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
       
       buyer = Buyer.create(item_id: item_id, user_id: user_id)
       Address.create(post_code: post_code, area_id: area_id,city: city,house_number: house_number, house_name: house_name, phone_number: phone_number,buyer_id: buyer.id)

  end
end
