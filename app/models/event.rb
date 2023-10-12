class Event < ApplicationRecord
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_status, inclusion:[true, false]
  validates :url_strings, presence: true
end
