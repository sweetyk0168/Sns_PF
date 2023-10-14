class RemoveEventIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :event_id, :integer
  end
end
