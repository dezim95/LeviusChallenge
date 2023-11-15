class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :author
      t.string :topic
      t.string :grade
      t.text :statement

      t.timestamps
    end
  end
end
