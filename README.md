What is social sofa?
====================

For our 2010 Rails Rumble we are building a product called Social Sofa.
It's a mashup of lots of interesting technology and services to build a solid foundation for harvesting and querying data for the purposes of Social Media Monitoring (although we see plenty of other applications for it).
The data will be stored in CouchDB and we're using a fantastic project at http://github.com/maxogden/couchpubtato as the starting point for this. This already does a lot of the leg work for us as it subscribes to PubSubHubbubb enabled feeds and stores the data straight in to CouchDB for us. This combined with the fantastic SuperFeedr http://superfeedr.com/ is a great starting point for pulling in loads of Social Data.

## So what are we providing?

* API in to Couch which provides:
  * Full text search capabilities
  * Direct feed retrieval
* Admin interface for managing feeds (or Data Sources)
* Lightweight user front-end for querying the data and returning source


It's also our intention to make each Social Sofa a PubSubHubbubb publisher as well. As well as the obvious benefits for anyone that might want to subscribe to a given feed from a Social Sofa data store, our ultimate intention with this is that you can then build a cluster of Social Sofas that distribute data between themselves over public HTTP. We will also be looking at XMPP for this.

At a later date we hope to build modules for additional data sources such as Facebook, LinkedIn, OStatus or anything else that might not be accessible through feeds. It's unlikely we'll get this far during the Rumble though.

This project will be released after the rumble as open source, license is yet to be determined.