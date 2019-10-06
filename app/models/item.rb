class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User",optional: true
  belongs_to :category, optional: true
  has_many :images
  mount_uploader :image, ImageUploader

  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :shipping_way
  belongs_to_active_hash :prefecture
end
