# frozen_string_literal: true

module ShowsHelper
  def standard_date_time(datetime)
    datetime.strftime('%d %b %Y %I:%M %p')
  end
end
