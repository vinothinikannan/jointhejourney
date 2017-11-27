class Menuitem < ContentfulModel::Base
  include FindAll
  self.load_depth = 3
  self.content_type_id = 'menuItem'
end