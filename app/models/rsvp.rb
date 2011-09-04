class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  YES=1
  NO=2
  MAYBE=3

  def self.rsvp!(event, user, reply, force = false)
    rsvp = user.rsvp(event)
    if rsvp
      return unless force
      #return if Rsvp.where("event_id = ? AND user_id = ?", event.id, user.id) && !force
    else
      rsvp = Rsvp.new
      rsvp.event = event
      rsvp.user = user
    end
    rsvp.reply = reply
    rsvp.save
  end

  def self.rsvpd?(event, user)
    !Rsvp.where("event_id = ? AND user_id = ?", event.id, user.id).empty?
  end
end
