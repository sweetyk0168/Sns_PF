class CreateEventQuestionnairesAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_questionnaires_answers do |t|
      t.integer  :gender, null: false
      t.text     :reason, null: false, default: ""
      t.integer  :satisfaction, null: false
      t.text     :reason_for_satisfaction, null: false, default: ""
      t.integer  :participation,  null: false
      t.text     :impressions, null: false, default: ""
      t.timestamps
    end
  end
end
