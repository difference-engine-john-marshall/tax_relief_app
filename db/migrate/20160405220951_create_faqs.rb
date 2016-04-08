class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question_text
      t.text :answer_text

      t.timestamps null: false
    end
  end
end
