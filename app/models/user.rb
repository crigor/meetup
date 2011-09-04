class User < ActiveRecord::Base
  def name
    "#{first_name} #{last_name}"
  end

  def rsvp(event)
    rsvp = Rsvp.where("event_id = ? AND user_id = ?", event.id, self.id)
    rsvp.empty? ? nil : rsvp[0]
  end
end
