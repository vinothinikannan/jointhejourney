module FindAll
  extend ActiveSupport::Concern

  included do
    class_attribute :load_depth,:order_by
    self.load_depth = 2
    self.order_by = {order:"asc"}
    def self.find_all(**attrs)
      find_by(attrs).load_children(load_depth).order(order_by).load
    end

  end
end