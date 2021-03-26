class CreditAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area, :city, :house_number, :house_name, :phone_number, :buyer_id
# ここにバリデーションの処理を書く
   with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :house_name
    validates :phone_number
    validates :buyer_id
   end
   validates :area, numericality: {other_than: 1, message: "can't be blank"}

  def save
       # 寄付情報を保存し、変数donationに代入する
       # 住所を保存する
       # donation_idには、変数donationのidと指定する
       Address.create(post_code: post_code, area: area, city: city, house_number: house_number, house_name: house_name,buyer_id: buyer_id)#donation_id: donation.id)
  end
end
