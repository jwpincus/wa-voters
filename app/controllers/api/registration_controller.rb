class Api::RegistrationController < ApplicationController
  protect_from_forgery with: :exception, except: [:index]

  def index
    @stats = Voter.stats(filter_params)
    render json: @stats
  end

  private
  def filter_params
    params.permit(:zip, :city, :age, :county)
  end
end
