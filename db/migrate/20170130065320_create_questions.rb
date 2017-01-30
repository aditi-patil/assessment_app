class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :answer
      t.references :assessment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
