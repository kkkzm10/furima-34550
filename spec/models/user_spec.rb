require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、family_name、first_name、family_name_jpn、first_name_jpn、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '1a0000'
      @user.password_confirmation = '1a0000'
      expect(@user).to be_valid
    end
   end
   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_jpnが空では登録できない' do
      @user.family_name_jpn = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jpn can't be blank")
    end
    it 'first_name_jpnが空では登録できない' do
      @user.first_name_jpn = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jpn can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456ab'
      @user.password_confirmation = '1234567ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください')
    end
    it 'passwordが全角では登録できない' do
      @user.password = '１１１ａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字を使用してください') 
    end
    it 'family_nameは全角でなければ登録できない' do
      @user.family_name = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    it 'first_nameは全角でなければ登録できない' do
      @user.first_name = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'family_name_jpnは全角（カタカナ）でなければ登録できない' do
      @user.family_name_jpn = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jpn 全角カナを使用してください")
    end
    it "first_name_jpnは全角（カタカナ）でなければ登録できない" do
      @user.first_name_jpn = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jpn 全角カナを使用してください")
    end
    it 'family_name_jpnは半角では登録できない' do
      @user.family_name_jpn = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name jpn 全角カナを使用してください")
    end
    it "first_name_jpnは半角では登録できない" do
      @user.first_name_jpn = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name jpn 全角カナを使用してください")
    end
   end
  end
end
