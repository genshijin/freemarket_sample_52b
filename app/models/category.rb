class Category < ApplicationRecord
  has_one :category_option
  has_many :item
  has_ancestry
end
