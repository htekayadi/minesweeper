module ApplicationHelper
  def format_created_at_date(object)
    object.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%m/%d/%Y %I:%M %p")
  end
end
