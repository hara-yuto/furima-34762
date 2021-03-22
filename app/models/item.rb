class Item < ApplicationRecord



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category , :condition , :payer , :area , :delivery_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :name,            length:{maximum: 40}
  validates :introduction,    length:{maximum: 1000}
  

  with_options numericality: { other_than: 1, message:"Select"} do
  validates :category_id          
  validates :condition_id         
  validates :payer_id             
  validates :area_id              
  validates :delivery_day_id     
  end

  validates :price,      format: { with: /\A[0-9]+\z/},
  numericality: { only_integer: true,greater_than: 299, less_than: 10000000, message:"Out of setting range"}, allow_blank: true
  validates :price
  validates :user
  
  end
end