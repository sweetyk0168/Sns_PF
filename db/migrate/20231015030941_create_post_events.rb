class CreatePostEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_events do |t|
      t.references :post, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
