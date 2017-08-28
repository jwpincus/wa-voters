class Voter < ApplicationRecord
  has_many :votes
  scope :city, -> (city) { where city: city.upcase }
  scope :zip_code, -> (zip) { where zip: zip }
  scope :last_name, -> (last_name) { where last_name: last_name.upcase }
  scope :first_name, -> (first_name) { where first_name: first_name.upcase }
  scope :county, -> (county) { where county: county.upcase }
  scope :age, -> (age) { where birthdate: (Date.today - (age.split('-').last).to_i.years)..(Date.today - (age.split('-').first).to_i.years) }

  def self.search(params)
    params = params.to_h
    attrs_name_to_search = %w( zip city last_name first_name county age)
    filtered_params = params.slice(*attrs_name_to_search).select { |_,v| v.present? }
    filtered_params.each {|k,v| filtered_params[k] = v.upcase }
    sql_cond = filtered_params.map { |k,_| "#{k} = :#{k}" }.join(' AND ')
    where(sql_cond, filtered_params)
  end

  def full_name
    "#{first_name.capitalize} #{middle_name.capitalize if middle_name} #{last_name.capitalize}"
  end

  def self.stats(params)
    stats = select('count(*) as total_voters',
    "SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_voters",
    "SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_voters",
    "SUM(CASE WHEN gender = 'U' THEN 1 ELSE 0 END) AS no_gender_voters").reorder('')
    params.each { |key, value|
      stats = stats.public_send(key, value)
    }
    stats
  end
end
