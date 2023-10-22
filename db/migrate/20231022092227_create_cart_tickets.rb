class CreateCartTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_tickets do |t|
      t.integer :event_ticket_id
      t.integer :customer_id
      t.integer :amount, null:false
      t.timestamps
    end
  end
end
