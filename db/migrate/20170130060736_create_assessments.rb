class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :title
      t.integer :marks
      t.time :max_time
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
