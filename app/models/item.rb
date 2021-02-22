class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule 
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
   validates :image
   validates :name
   validates :item_info
   validates :category_id,     numericality: { other_than: 1 }
   validates :status_id,       numericality: { other_than: 1 }
   validates :shipping_fee_id, numericality: { other_than: 1 }
   validates :prefecture_id,   numericality: { other_than: 1 }
   validates :schedule_id,     numericality: { other_than: 1 }
   validates_inclusion_of :price, in:300..9999999, format: {with: /\A[0-9]+\z/, message: '半角数字を使用してください'}
  end 
end
