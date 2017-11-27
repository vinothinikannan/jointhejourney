class CalendarController < ApplicationController
	def index
  	@page = Page.find_first(url: 'calendar')
  	@calendar= Calendar.find_all();
	end

	def show
		@page = Page.find_first(url: 'calendar')
		@url = params[:id]
		start_date=@url+'-1-1'
		end_date=@url+'-12-31'
		limit=300

		#fetch all entries between two dates from API
		get_all_entries = Entry.find_by_date(start_date,end_date,limit)

		if get_all_entries['entries'].present?
			entry_first = get_all_entries['entries'].first
			entry_first_date = Date.parse(entry_first['date'])
			entry_last = get_all_entries['entries'].last
			entry_last_date = Date.parse(entry_last['date'])

			#format entries to required calendar format
			@data = Calendar.format_calendar_data(get_all_entries)

			#find all months between two dates
			@months = (entry_first_date..entry_last_date).map{|m| m.strftime('%m')}.uniq.map{ |m| Date::MONTHNAMES[ m[/\d\d$/ ].to_i ] } 
		end
		
	end
end