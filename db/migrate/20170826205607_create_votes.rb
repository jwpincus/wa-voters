class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :voter, foreign_key: true, type: :string
      t.string :date
      t.string :county

      t.timestamps
    end
  end
end
