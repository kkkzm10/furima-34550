require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1 
    end
  describe '購入情報の保存' do
   context '商品が購入できるとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '建物名が空でも購入できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
   end 
   context '商品が購入できないとき' do
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'city_nameが空だと保存できないこと' do
      @order_address.city_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City name can't be blank")
    end
    it 'address_numが空だと保存できないこと' do
      @order_address.address_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address num can't be blank")
    end
    it 'phone_numが空だと保存できないこと' do
      @order_address.phone_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
   end 
  end
end
