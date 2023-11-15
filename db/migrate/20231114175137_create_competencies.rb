class CreateCompetencies < ActiveRecord::Migration[7.0]
  def change
    create_table :competencies do |t|
      t.string :competency

      t.timestamps
    end
  end
end
