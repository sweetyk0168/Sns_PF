class EventRepo < ApplicationRecord
  belongs_to :customer
  
  validates :event_repos_title,presence: true
  validates :event_repos_body,presence: true
end
