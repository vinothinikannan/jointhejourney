class Heroimage < ContentfulModel::Base
  include FindAll
  self.load_depth = 1
  self.order_by={start_date: 'asc'}
  self.content_type_id = 'HeroImage'
end