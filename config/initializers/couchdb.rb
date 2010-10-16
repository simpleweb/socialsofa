COUCHHOST = ENV['COUCHHOST'] || "http://127.0.0.1:5984"

CouchServer = CouchRest::Server.new(COUCHHOST)
CouchServer.default_database = "socialsofa-#{Rails.env}"
