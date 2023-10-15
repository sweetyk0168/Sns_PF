class Event < ApplicationRecord
  belongs_to :genre
  has_many :post_events, dependent: :destroy
  has_many :posts, through: :post_events, dependent: :destroy
  

  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_status, inclusion:[true, false]
  validates :url_strings, presence: true

  
end
