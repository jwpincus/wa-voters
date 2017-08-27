class ChangeVoters < ActiveRecord::Migration[5.1]
  def change
    rename_column :voters, :state_voter_id, :id
  end
end
