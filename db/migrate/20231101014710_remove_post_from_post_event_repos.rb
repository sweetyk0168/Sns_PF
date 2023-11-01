class RemovePostFromPostEventRepos < ActiveRecord::Migration[6.1]
  def change
    remove_reference :post_event_repos, :post, null: false, foreign_key: true
    remove_reference :post_event_repos, :event_repo, null: false, foreign_key: true
  end
end
