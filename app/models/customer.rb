class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

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

  #プロフィール画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end