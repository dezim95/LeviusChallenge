class CreateQuestionSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :question_subjects do |t|
      t.references :question, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
