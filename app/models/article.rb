class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category , :condition , :payer , :area , :delivery_day

  validates :category , :condition , :payer , :area , :delivery_day, numericality: { other_than: 1 } 
end
