class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :score
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end