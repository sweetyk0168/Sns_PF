class EventTicket < ApplicationRecord
  belongs_to :genre
  has_many   :posts, dependent: :destroy
  has_many   :events, dependent: :destroy

  validates :ticket_name, presence: true
  validates :ticket_introduction, presence: true
  validates :ticket_price, presence: true
  validates :sales_status, inclusion:[true, false]

  def add_tax_ticket_price
    (self.ticket_price * 1.10).round
  end
end