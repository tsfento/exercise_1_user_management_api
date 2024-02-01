class ChangeValueTypeOnUserAge < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :age, :integer
  end
end
