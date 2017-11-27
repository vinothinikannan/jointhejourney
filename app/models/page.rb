class Page < ContentfulModel::Base
	return_nil_for_empty :title
  include FindFirst
  self.load_depth = 10
  self.content_type_id = 'Page'
end