class EventQuestionnairesQuestion < ApplicationRecord
  has_many :event_questionnaires_answers

  validates :title,presence: true
  validates :content,presence: true
end
