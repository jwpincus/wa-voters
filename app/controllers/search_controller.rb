class SearchController < ApplicationController

  def index
  end

  def find
    @voters = Voter.search(search_params)
    redirect_to action: index
  end


  def show

  end

end
