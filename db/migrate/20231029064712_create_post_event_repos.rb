class CreatePostEventRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :post_event_repos do |t|
      t.references :event_repo, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
