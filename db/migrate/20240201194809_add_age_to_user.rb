class AddAgeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :string
  end
end
