class Voter < ApplicationRecord
  
  def self.search(params)
    params = params.to_h
    attrs_name_to_search = %w( zip city last_name first_name )
    filtered_params = params.slice(*attrs_name_to_search).select { |_,v| v.present? }
    sql_cond = filtered_params.map { |k,_| "#{k} ILIKE :#{k}" }.join(' AND ')
    where(sql_cond, filtered_params)
  end

  def full_name
    "#{first_name.capitalize} #{middle_name.capitalize if middle_name} #{last_name.capitalize}"
  end

end
