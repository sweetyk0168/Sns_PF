class EventRepo < ApplicationRecord
  belongs_to :genre
  has_many_attached :images
  has_many :post_event_repos, dependent: :destroy, foreign_key: 'event_repo_id'
  has_many :posts, through: :post_event_repos

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
