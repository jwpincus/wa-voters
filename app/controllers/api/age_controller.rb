class Api::AgeController < ApplicationController
  protect_from_forgery with: :exception, except: [:index]

  def index
    @stats = Voter.select("date_trunc('year', birthdate) as birthyear", 'count(*) as voters_registered').group("birthyear").order('voters_registered')
    render json: @stats
  end

  private
  def filter_params
    params.slice(:zip_code, :city, :age, :county)
  end
end
