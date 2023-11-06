class RemoveEventQuestionnairesQuestionIdFromEventQuestionnairesAnswer < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :event_questionnaires_answers, :event_questionnaires_questions
    remove_reference :event_questionnaires_answers, :event_questionnaires_question_id, index: true
  end
end
