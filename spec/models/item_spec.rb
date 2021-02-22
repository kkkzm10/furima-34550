require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
   context '商品出品ができるとき' do
    it 'imageとname、item_info、category_id、status_id、shipping_fee_id、prefecture_id、schedule_id、priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
   end
   context '商品出品ができないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'item_infoが空では登録できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'status_idが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'status_idが1では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'shipping_fee_idが空では登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it 'shipping_fee_idが1では登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'schedule_idが空では登録できない' do
      @item.schedule_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule can't be blank")
    end
    it 'schedule_idが1では登録できない' do
      @item.schedule_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule must be other than 1")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが¥300~¥9,999,999の間でないと保存できない' do
      @item.price = 50
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceは半角数字でないと保存できない' do
      @item.price = "３５０"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが10,000,000以上では登録できない' do
      @item.price = "1000000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角英語では登録できない' do
      @item.price = "aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角英数字混合では登録できない' do
      @item.price = "123asd"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
   end 
  end
end
