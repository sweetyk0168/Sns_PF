class PostEvent < ApplicationRecord
  belongs_to :post
  belongs_to :event
end
