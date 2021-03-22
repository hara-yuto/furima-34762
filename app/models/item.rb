class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category , :condition , :payer , :area , :delivery_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :image
  validates :name
  validates :introduction
  validates :category_id          ,numericality: { other_than: 1, message:"Select"}
  validates :condition_id         ,numericality: { other_than: 1,message:"Select"}
  validates :payer_id             ,numericality: { other_than: 1, message:"Select"}
  validates :area_id              ,numericality: { other_than: 1, message:"Select"}
  validates :delivery_day_id      ,numericality: { other_than: 1 ,message:"Select"}
  validates :price,      format: { with: /\A[0-9]+\z/},
  numericality: { only_integer: true,greater_than: 299, less_than: 10000000, message:"Out of setting range"}, allow_blank: true
  validates :price
  validates :user
  
  end
end
