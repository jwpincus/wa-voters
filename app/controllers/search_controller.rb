class SearchController < ApplicationController

  def index
  end

  def find
    @voters = Voter.search(search_params)
    redirect_to action: index
  end


  private
  def search_params
    params.permit(:first_name, :last_name, :zip, :city)
  end

end
