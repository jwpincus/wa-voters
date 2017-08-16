
require 'csv'
Voter.delete_all
errors = []
CSV.foreach('db/voters.txt', {headers: true,  col_sep: "\t", encoding: 'ISO-8859-1', quote_char: "|"} ) do |row|
  begin
    if row['StateVoterID']
      v = Voter.new
      v.state_voter_id = row['StateVoterID']
      v.county_voter_id = row['CountyVoterID']
      v.first_name = row['FName']
      v.middle_name = row['MName']
      v.last_name = row['LName']
      v.suffix = row['NameSuffix']
      v.birthdate = row['Birthdate']
      v.gender = row['Gender']
      v.add_st_num = row['RegStNum']
      v.add_st_name = row['RegStName']
      v.add_st_type = row['RegStType']
      v.add_pre_direction = row['RegStPreDirection']
      v.add_post_direction = row['RegStPostDirection']
      v.add_unit_num = row['RegUnitNum']
      v.city = row['RegCity']
      v.state = row['RegState']
      v.zip = row['RegZipCode']
      v.county = row['CountyCode']
      v.precinct = row['PrecinctCode']
      v.leg_dist = row['LegislativeDistrict']
      v.cong_dist = row['CongressionalDistrict']
      v.reg_date = row['Registrationdate']
      v.last_vote = row['LastVoted']
      v.status = row['StatusCode']
      v.add_unit_type = row['RegUnitType']
      if v.save
        puts "#{v.first_name} #{v.last_name} saved to DB"
      end
    end
  rescue CSV::MalformedCSVError

  end
end
puts "#{Voter.count} new records created"
puts errors
