class AddCoolnessToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :coolness, :int , :default => 1
  end
end
