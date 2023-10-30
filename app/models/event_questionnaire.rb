class EventQuestionnaire < ApplicationRecord
  belongs_to genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_status, inclusion:[true, false]
  validates :chance, presence: true
  validates :satisfaction, presence: true
  validates :reason_for_satisfaction, presence: true
  validates :chance, presence: true
  validates :impressions, inclusion:[true, false]
  validates :gender, presence: true
  validates :participation, presence: true

  enum gender: {男:1, 女:2}
  enum participation: {参加したい:1, 参加したくない:2}
end
