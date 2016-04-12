class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :prequalifier, :integer
  end
end
