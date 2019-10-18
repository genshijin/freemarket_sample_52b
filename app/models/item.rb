class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :category, optional: true
  has_many :images

  mount_uploader :image, ImageUploader
  # accepts_nested_attributes_for :images
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :shipping_way
  belongs_to_active_hash :prefecture
  
  enum item_status:{exhibition: 0,trading:1,completed:2,stopping:3}

  validate :add_error_sample
 
  def add_error_sample
    if name.blank?
      errors[:name] << "入力してください"
    end
 
    if comment.blank?
      errors[:comment] << "入力してください"
    end

    if price.blank? or price < 300 or price > 9999999
      errors[:price] << "300以上9999999以下で入力してください"        
    end
    
    if category.blank?
      errors[:category] << "選択してください"
    end

    if image.blank?
      errors[:image] << "画像がありません"
    end

    if state.blank?
      errors[:state] << "選択してください"
    end

    if shipping_date.blank?
      errors[:shipping_date] << "選択してください"
    end

    if postage_burden.blank?
      errors[:postage_burden] << "選択してください"
    end

    if shipping_way.blank?
      errors[:shipping_way] << "選択してください"
    end

    if prefecture.blank?
      errors[:prefecture] << "選択してください"
    end
  end
end
