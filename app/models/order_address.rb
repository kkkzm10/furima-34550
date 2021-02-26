class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :address_num, :building, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_name
    validates :address_num
   
    validates :phone_num, format: {with: /\A\d{11}\z/, message: "is out of setting range"}
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, address_num: address_num, building: building, phone_num: phone_num)
  end

end