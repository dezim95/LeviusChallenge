class RenameSubjectAndCompetencyColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :subjects, :subject, :subject_name
    rename_column :competencies, :competency, :competency_name
  end
end
