class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.references :assessment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :answers
      t.string :marks
      t.string :rank

      t.timestamps null: false
    end
  end
end
