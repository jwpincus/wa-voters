class AddFirstNameIndexToVoters < ActiveRecord::Migration[5.1]
  def change
    add_index :voters, :first_name
    add_index :voters, :last_name
    add_index :voters, :zip
    add_index :voters, :city
  end
end
