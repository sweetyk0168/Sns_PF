class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #バリデーション
   validates :last_name, presence: true
   validates :first_name, presence: true
   validates :last_name_kana, presence: true
   validates :first_name_kana, presence: true
   validates :email, presence: true
   validates :telephone_number, presence: true
   validates :postal_code, presence: true
   validates :address, presence: true

  #enum設定
  #enum is_deleted: { 有効: 0, 無効: 1}
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ゲスト"
      customer.first_name ="ゲスト"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ゲスト"
      customer.telephone_number = "12345678910"
      customer.postal_code = "1234567"
      customer.address = "a県a市△-△-△"
      customer.is_deleted = false
    end
  end
end