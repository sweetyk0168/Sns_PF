class CartTicket < ApplicationRecord
  belongs_to :customer
  belongs_to :event_ticket

  validates :amount, presence:true
  validate :event_ticket_id
  validate :customer_id
end
