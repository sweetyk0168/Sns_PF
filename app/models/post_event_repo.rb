class PostEventRepo < ApplicationRecord
  belongs_to :event_repo
  belongs_to :post
end
