module RsvpsHelper
  def change_reply_text(event, user)
    rsvp = user.rsvp(event)
    case rsvp.reply
    when Rsvp::YES
      "You are attending the event. Change to #{link_to 'No', reply_event_url(:reply => Rsvp::NO, :force => true)} or #{link_to 'Maybe', reply_event_url(:reply => Rsvp::MAYBE, :force => true)}"
    when Rsvp::NO
      "You are not attending the event. Change to #{link_to 'Yes', reply_event_url(:reply => Rsvp::YES, :force => true)} or #{link_to 'Maybe', reply_event_url(:reply => Rsvp::MAYBE, :force => true)}"
    when Rsvp::MAYBE
      "You are not sure if you are attending. Change to #{link_to 'Yes', reply_event_url(:reply => Rsvp::YES, :force => true)} or #{link_to 'No', reply_event_url(:reply => Rsvp::NO, :force => true)}"
    end
  end
end
