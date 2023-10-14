class CreatePostEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_events do |t|
      t.integer :event_id
      t.integer :post_id
      t.timestamps
    end
  end
end
