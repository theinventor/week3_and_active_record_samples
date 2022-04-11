module TripsHelper

  def local_time timestamp
    # should build html like; <span data-controller="local-time"><%= trip.created_at %></span>
    content_tag(:span, timestamp, data: {controller: 'local-time'})
  end
end
