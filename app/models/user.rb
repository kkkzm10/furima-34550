class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname 
    validates :email, format: {with: /@.+/, message: 'メールアドレスには@を入れてください'}
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を使用してください' }
   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do    
    validates :family_name     
    validates :first_name  
   end
   with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do    
    validates :family_name_jpn 
    validates :first_name_jpn 
   end
    validates :birthday   
 end      
end
