class EventsController < InheritedResources::Base
  before_filter :login_required, :except => [:show]
  def reply
    Rsvp.rsvp!(resource, current_user, params[:reply], params[:force])
    redirect_to event_url(@event)
  end
end
