class Event < ApplicationRecord
  belongs_to :genre
  has_many :event_repos, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :image


  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_status, inclusion:[true, false]
  validate :url_strings
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
