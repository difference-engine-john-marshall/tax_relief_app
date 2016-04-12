class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text 
      t.string :qualifying_response
      t.integer :next_question_id

      t.timestamps null: false
    end
  end
end
