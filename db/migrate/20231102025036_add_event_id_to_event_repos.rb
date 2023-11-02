class AddEventIdToEventRepos < ActiveRecord::Migration[6.1]
  def change
    add_column :event_repos, :event_id, :integer
  end
end
