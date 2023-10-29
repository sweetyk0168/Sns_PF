class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :event, optional: true
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image
  has_many :post_event_repos, dependent: :destroy
  has_many :event_repos, through: :post_event_repos

  validates :title, presence: true
  validates :body, presence: true, allow_blank: true
  attr_accessor :event_repo_ids
  attr_accessor :event_id

  # before_save :set_default_event_id

  # def set_default_event_id
  #   self.event_id ||= Event.first.id
  # end

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
