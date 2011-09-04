class EventsController < InheritedResources::Base
  before_filter :login_required, :only => :new
end
