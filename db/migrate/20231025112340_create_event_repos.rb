class CreateEventRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :event_repos do |t|
      t.integer :customer_id, null:false
      t.string  :event_repos_title, null:false
      t.text    :event_repos_body, null:false
      t.timestamps
    end
  end
end
