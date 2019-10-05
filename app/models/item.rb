class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User",optional: true
  belongs_to :category, optional: true
  has_many :images
  mount_uploader :image, ImageUploader
end
