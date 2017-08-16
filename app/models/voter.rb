class Voter < ApplicationRecord
  def self.search(params)
      where("zip LIKE ? OR city LIKE ? OR last_name LIKE ? OR first_name LIKE ?", "%#{params[:zip]}%","%#{params[:city]}%","%#{params[:last_name]}%","%#{params[:first_name]}%")
  end
end
