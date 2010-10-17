class Subscription < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  VALID_URI_SCHEMES = ['http', 'https']
  validates_presence_of :topic
  validates_uniqueness_of :topic
  validate :url_must_be_valid
  before_save :subscribe_to_topic
  before_destroy :unsubscribe_from_topic

private
  def url_must_be_valid
    parsed = URI.parse(topic)
    if !VALID_URI_SCHEMES.member?(parsed.scheme)
      raise URI::InvalidURIError
    end
  rescue URI::InvalidURIError => e
    errors.add(:topic, 'is not a valid URL')
  end

  def post_options
    @options ||= {
      :query => {
        :'hub.verify' => 'sync',
        :'hub.callback' => 'http://hecticjeff.couchone.com/socialsofa-development/_design/push/_rewrite/xml',
        :'hub.topic' => self.topic
      },
      :basic_auth => {
        :username => ENV['SUPERFEEDR_USER'],
        :password => ENV['SUPERFEEDR_PASS']
      }
    }
  end

  def subscribe_to_topic
    post_options[:query][:'hub.mode'] = 'subscribe'
    response = HTTParty.post('http://superfeedr.com/hubbub', post_options)
    if response.code != 204
      errors.add(:topic, 'could not be subscribed to')
      false
    end
  end

  def unsubscribe_from_topic
    post_options[:query][:'hub.mode'] = 'unsubscribe'
    response = HTTParty.post('http://superfeedr.com/hubbub', post_options)
    if response.code != 204
      errors.add(:topic, 'could not be unsubscribed from')
      false
    end
  end
end
