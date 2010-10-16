class Subscription < ActiveRecord::Base
  validates_presence_of :user_id, :topic
  belongs_to :user
end
