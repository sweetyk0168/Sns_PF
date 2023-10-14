class Post < ApplicationRecord
  belongs_to :customer
  has_many :events
  validates :title, presence: true
  # validates :body, presence: true
end
