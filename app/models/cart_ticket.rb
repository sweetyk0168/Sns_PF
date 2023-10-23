class CartTicket < ApplicationRecord
  belongs_to :customer
  belongs_to :event_ticket

  validates :amount, presence:true

end
