class Calendar < ContentfulModel::Base
	return_nil_for_empty :title
  include FindFirst
  include FindAll
  self.load_depth = 3
  self.order_by = {title: 'desc'}
  self.content_type_id = 'Calendar'

  def self.format_calendar_data(raw_data)
  	# required calendar format
  	# {
  	#		"2017-11-02":[
  	#									 	{"content":"Romans 14:10-12","url":"/599-jesus-set-me-free-from-fixing-others","allDay":true},
  	#										{"content":"by ellie blocker","url":"/599-jesus-set-me-free-from-fixing-others","allDay":true}
  	#									],
  	# 	"2017-11-03":[
  	#										{"content":"Romans 14:5-12","url":"/600-to-eat-or-not-to-eat-that-is-the-question","allDay":true},
  	#										{"content":"by Micah Leiss","url":"/600-to-eat-or-not-to-eat-that-is-the-question","allDay":true}
  	#									]
  	#	}

  	data = 	raw_data['entries'].map do |entry|
  						if entry['title'].nil?
        				url_title = ''
      				else
        				url_title = entry['title'].parameterize
      				end
      				title = entry['scripture'].capitalize
				  		writer = entry['writer']['name']
				  		writer = 'by '+writer
				  		url = "/#{entry['id']}-#{url_title}"
				  		entry_date = entry['date']

  						[entry_date,  [title, writer].map do |content|
                {content: content,url: url, allDay: true}
            	end]

						end.to_h
		data.to_json
  end

end