class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :category
    validates :brand
    validates :color
    validates :size
  end

  validates :price, numericality: { only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :brand
  belongs_to_active_hash :color
  belongs_to_active_hash :size

  with_options numericality: { other_than: 1 } do
    validates :category_id, :brand_id, :color_id, :size_id
  end
end
