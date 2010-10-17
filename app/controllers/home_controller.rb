require 'simple_couch'
require 'pp'

class HomeController < ApplicationController
  def index
    @feeds = SimpleCouch.all_feeds["rows"]
  end

  def search
    @query = params[:q]
    if @query
      matches = SimpleCouch.search_by_content(params[:q]).parsed_response
      @results = []
      matches["rows"].each do |result|
        @results << SimpleCouch.get('/'+result["id"]).parsed_response
      end
    end
  end

end
