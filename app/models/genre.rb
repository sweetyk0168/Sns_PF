class Genre < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :eventtickets, dependent: :destroy

  validates :name, presence: true
end
