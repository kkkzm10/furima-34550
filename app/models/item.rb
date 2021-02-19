class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule 
  has_one_attached :image

  validates :title, :text, presence: true

  validates :category_id,     numericality: { other_than: 1 }
  validates :status_id,       numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :schedule_id,     numericality: { other_than: 1 }
end
