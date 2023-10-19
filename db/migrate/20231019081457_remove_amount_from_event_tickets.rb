class RemoveAmountFromEventTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_tickets, :amount, :integer
  end
end
