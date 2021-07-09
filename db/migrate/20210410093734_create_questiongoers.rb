class CreateQuestiongoers < ActiveRecord::Migration[6.1]
  def change
    create_table :questiongoers do |t|
      t.string :name

      t.timestamps
    end
  end
end
