class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :attending_users, :source => :user, :through => :rsvps, :conditions => "reply = #{Rsvp::YES}"
  scope :upcoming, lambda { where("start_date >= ?", Date.today) }
end
