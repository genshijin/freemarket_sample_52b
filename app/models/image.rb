class Image < ApplicationRecord
  # belongs_to :item,optional: true
  # mount_uploader :image, ImageUploader
  belongs_to :item
end
