class UpdateColumnsInQuestionsController < ActiveRecord::Migration
  def change
    rename_column :questions, :qualifying_response, :yes_response
    rename_column :questions, :next_question_id, :no_response
  end
end
