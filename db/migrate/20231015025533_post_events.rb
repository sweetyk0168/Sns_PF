class PostEvents < ActiveRecord::Migration[6.1]
  def change
    drop_table :post_events
  end
end
