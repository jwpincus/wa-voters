class ChangeDateStringToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :voters, :birthdate, 'date USING CAST(birthdate AS date)'
  end
end
