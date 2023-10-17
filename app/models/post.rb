class Post < ApplicationRecord
  belongs_to :customer
  has_many :post_events, dependent: :destroy
  has_many :events, through: :post_events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  # validates :body, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
