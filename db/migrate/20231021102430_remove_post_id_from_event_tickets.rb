class RemovePostIdFromEventTickets < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_tickets, :post_id, :integer
    remove_column :event_tickets, :event_id, :integer
  end
end
