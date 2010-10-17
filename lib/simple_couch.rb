class SimpleCouch
  include HTTParty
  format :json
  base_uri 'http://127.0.0.1:5984/socialsofa-development'
  
  def self.search_by_content(query)
    get("/_fti/_design/push/by_content?q=#{CGI::escape(query)}")
  end
  
  def self.search_by_feed(query)
    get("/_fti/_design/push/by_feed?q=#{CGI::escape(query)}")
  end

  def self.all_feeds
    get("/_design/push/_view/feeds?group=true")
  end
end
