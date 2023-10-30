class CreateEventQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :event_questionnaires do |t|
      t.integer :genre_id, null:false
      t.string  :name, null:false
      t.text    :introduction, null:false
      t.integer :gender, null:false
      t.text    :chance, null:false
      t.integer :satisfaction, null:false
      t.text    :reason_for_satisfaction, null:false
      t.integer :participation, null:false
      t.text    :impressions, null:false
      t.boolean :post_status, null:false, default: true
      t.timestamps
    end
  end
end
