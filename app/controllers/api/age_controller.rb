class Api::AgeController < ApplicationController
  protect_from_forgery with: :exception, except: [:index]

  def index
    @stats = Voter.search(filter_params)
    @stats = @stats.select("extract(year FROM birthdate)::int as birthyear", 'count(*) as voters_registered').group("birthyear").order('birthyear')
    render json: @stats
  end

  private
  def filter_params
    params.slice(:zip_code, :city, :age, :county)
  end
end
