class SearchController < ApplicationController

  def index
  end

  def find
    @voters = Voter.search(search_params).paginate(page: params[:page], per_page: 100)
  end

  def pagination
    @voters = Voter.search(search_params).paginate(page: params[:page], per_page: 100)
    render :inline => "<%= will_paginate @voters, params: {'controller' => 'search', 'action'=>'find'} %>"
  end


  private

  def search_params
    params.permit(:first_name, :last_name, :zip_code, :city)
  end

end
