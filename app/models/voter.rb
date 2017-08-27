class Voter < ApplicationRecord
  has_many :votes
  def self.search(params)
    params = params.to_h
    attrs_name_to_search = %w( zip city last_name first_name county )
    filtered_params = params.slice(*attrs_name_to_search).select { |_,v| v.present? }
    filtered_params.each {|k,v| filtered_params[k] = v.upcase}
    sql_cond = filtered_params.map { |k,_| "#{k} = :#{k}" }.join(' AND ')
    where(sql_cond, filtered_params)
  end

  def full_name
    "#{first_name.capitalize} #{middle_name.capitalize if middle_name} #{last_name.capitalize}"
  end

  def self.stats(params)
    select('count(*) as total_voters',
    "SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_voters",
    "SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_voters",
    "SUM(CASE WHEN gender = 'U' THEN 1 ELSE 0 END) AS no_gender_voters").reorder('').search(params)
  end
end
