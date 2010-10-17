require 'simple_couch'
require 'pp'

class HomeController < ApplicationController
  def index
    @query = params[:q]
    if @query
      matches = SimpleCouch.search_by_content(params[:q]).parsed_response
      @results = []
      matches["rows"].each do |result|
        @results << SimpleCouch.get('/'+result["id"]).parsed_response
      end
    end
  end

  def all
    @feeds = SimpleCouch.all_feeds["rows"]
  end
end
