module FindFirst
  extend ActiveSupport::Concern

  included do
    class_attribute :load_depth
    self.load_depth = 10

    def self.find_first(**attrs)
      find_by(attrs).load_children(load_depth).load.first
    end
  end
end