class EventTicket < ApplicationRecord
  belongs_to :genre
  has_many :cart_tickets, dependent: :destroy

  validates :event_title, presence: true
  validates :ticket_startday, presence: true
  validates :ticket_endday, presence: true
  validates :ticket_place,  presence: true
  validates :ticket_name, presence: true
  validates :ticket_introduction, presence: true
  validates :ticket_price, presence: true
  validates :sales_status, inclusion:[true, false]

  def add_tax_ticket_price
    (self.ticket_price * 1.10).round
  end
end