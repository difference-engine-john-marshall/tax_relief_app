class RemoveOrderQuestionsColumnInQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_order, :integer
  end
end
