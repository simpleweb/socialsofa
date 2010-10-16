class Entry < CouchRest::Model::Base
  use_database CouchServer.database('awesome-events')
  property :postedTime
  property :object
  property :verb
  property :actor
  property :feedMeta

  view_by :feed, :map => "
    function(doc) {
      if (doc['feedMeta']['link']) {
        emit(doc['postedTime'], null);
      }
    }
  "
end
