class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :customer

  validates :customer_id, presence: true, uniqueness: {scope: :post_id}
  validates :post_id, presence: true
end