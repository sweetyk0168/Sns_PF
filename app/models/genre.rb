class Genre < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :event_tickets, dependent: :destroy
  has_many :event_repos, dependent: :destroy

  validates :name, presence: true
end
