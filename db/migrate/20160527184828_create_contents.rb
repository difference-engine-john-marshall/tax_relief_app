class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :text
      t.boolean :equitable
      t.boolean :classic

      t.timestamps null: false
    end
  end
end
