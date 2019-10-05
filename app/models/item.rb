class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User",optional: true
  belongs_to :category, optional: true
  has_many :images
  accepts_nested_attributes_for :images

  belongs_to_active_hash :burdent
  belongs_to_active_hash :category
end
