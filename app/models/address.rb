class Address < ApplicationRecord
  belongs_to :buyer
  has_one :area
end
