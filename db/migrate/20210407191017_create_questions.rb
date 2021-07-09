class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :author
      t.integer :date

      t.timestamps
    end
  end
end
