class Address < ApplicationRecord
  belongs_to :buyer
  belongs_to :area
end
