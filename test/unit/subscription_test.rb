require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  should validate_uniqueness_of(:topic)
  should validate_presence_of(:topic)

  should allow_value('http://search.twitter.com/search.atom?q=valid').for(:topic)
  should_not allow_value('not valid').for(:topic)
  should_not allow_value('invalid').for(:topic)
end
