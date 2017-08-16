class CreateVoters < ActiveRecord::Migration[5.1]
  def change
    create_table :voters, id: false do |t|
      t.string :state_voter_id, null: false
      t.string :county_voter_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :birthdate
      t.string :gender
      t.string :add_st_num
      t.string :add_st_name
      t.string :add_st_type
      t.string :add_unit_type
      t.string :add_pre_direction
      t.string :add_post_direction
      t.string :add_unit_num
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :precinct
      t.string :leg_dist
      t.string :cong_dist
      t.string :reg_date
      t.string :last_vote
      t.string :status

      t.timestamps
    end
    add_index :voters, :state_voter_id, unique: true
  end
end
