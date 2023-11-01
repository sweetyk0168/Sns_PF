class EventQuestionnairesAnswer < ApplicationRecord
  belongs_to :event_questionnaires_question, optional: true
  belongs_to :customer, optional: true

  # validates :gender, presence: true
  # validates :reason, presence: true
  # validates :satisfaction, presence: true
  # validates :reason_for_satisfaction, presence: true
  # validates :participation, presence: true
  # validates :impressions, presence: true

  enum gender: {男:1, 女:2}
  enum participation: {参加したい:1, 参加したくない:2}
end
