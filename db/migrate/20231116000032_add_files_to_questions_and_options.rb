class AddFilesToQuestionsAndOptions < ActiveRecord::Migration[7.0]
  def change
    change_table :questions do |t|
      t.references :files, polymorphic: true
    end

    change_table :options do |t|
      t.references :files, polymorphic: true
    end
  end
end
