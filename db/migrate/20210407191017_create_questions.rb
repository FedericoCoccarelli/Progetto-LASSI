class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
