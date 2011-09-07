class EventsController < InheritedResources::Base
  before_filter :login_required, :except => [:show, :index]
  before_filter :login_sso_user, :only => [:index]

  def index
    @events = Event.upcoming.order("start_date")
  end
  def reply
    Rsvp.rsvp!(resource, current_user, params[:reply], params[:force])
    redirect_to event_url(@event)
  end
end
