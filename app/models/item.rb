class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,           presence: true
  validates :name,            presence: true
  validates :introduction,    presence: true
  validates :category_id ,    presence: true
  validates :condition_id,    presence: true
  validates :payer_id,        presence: true
  validates :area_id,         presence: true
  validates :delivery_day_id, presence: true
  validates :price,           presence: true
  validates :user,            presence: true

end
