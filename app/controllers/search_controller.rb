class SearchController < ApplicationController

  def index
    @results = ::HereApi::Geolocation.search_options( params[:location_name] )
  end

end