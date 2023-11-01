class EventRepo < ApplicationRecord
  belongs_to :genre
  belongs_to :customer
  belongs_to :event
  has_many_attached :images

  has_many :posts, dependent: :destroy

  validates :event_repos_title,presence: true
  validates :event_repos_body,presence: true
  validates :post_status, inclusion:[true, false]

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
