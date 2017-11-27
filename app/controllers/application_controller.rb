class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :title_tag

  def menu_items
    @menu_items ||=
      Menuitem.find_all()
  end
  helper_method :menu_items

  def hero_image
  	hero_image_list = Heroimage.find_all(start_date: {lte: DateTime.now})
    @hero_image= hero_image_list.items.last
  end
  helper_method :hero_image

end