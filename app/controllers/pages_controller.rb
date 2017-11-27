require 'time'
class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /
  def home
    @page = Page.find_first(url: 'home')
    load_journey = Jtjcms.find()
    if load_journey['curriculum'].present?
      @journey_days= load_journey['curriculum']['days_of_week']
      @journey_current_week = load_journey['current_week']
      @journey_current_week_first= @journey_current_week.first
      @journey_current_week_last= @journey_current_week.last
    	temp_date= Time.parse(load_journey['latest_entry']['date'])
      @journey_latest_date=temp_date.strftime('%B %d, %Y')
      @journey_latest_id = load_journey['latest_entry']['id']
    	@journey_latest_title = load_journey['latest_entry']['title']
    	@journey_latest_scripture_verse = load_journey["latest_entry"]["scripture"]["reference"]
    	@journey_latest_introduction = load_journey['latest_entry']["scripture"]["html"]
    	#@journey_scripture = 
    	@journey_latest_key_verse_reference = load_journey['latest_entry']['key_verse']['reference']
      @journey_latest_key_verse = load_journey['latest_entry']['key_verse']['html']
    	@journey_latest_central_truth = load_journey['latest_entry']['central_truth']
    	@journey_latest_devotional = load_journey['latest_entry']['reflection']
    	@journey_latest_author_name = load_journey['latest_entry']['writer']['name']
    	@journey_latest_author_twitter_handle = load_journey['latest_entry']['writer']['twitter_handle']
    	@journey_latest_author_bio = load_journey['latest_entry']['writer']['bio']
    	@journey_latest_author_picture = load_journey['latest_entry']['writer']['picture']
      @title_tag = @journey_latest_title
    else
      @title_tag = ""
    end
  end

    # GET /{slug}
  def show
    @page = Page.find_first(url: params[:slug])
    if @page.present?
      if @page.title.downcase == 'home'
        @title_tag = ""
      else
        @title_tag = ""
      end
    else
      @title_tag = "Page Not Found (404)"
      render :file => 'public/404.html', :layout => false
    end
  end

  def entry
    load_journey = Entry.find(params[:id])
    if load_journey['entry'].present?
      #@journey_days= load_journey['curriculum']['days_of_week']
      @journey_current_week = load_journey['week']
      @journey_current_week_first= @journey_current_week.first
      @journey_current_week_last= @journey_current_week.last
      temp_date= Time.parse(load_journey['entry']['date'])
      @journey_latest_date=temp_date.strftime('%B %d, %Y')
      @journey_latest_title = load_journey['entry']['title']
      @journey_latest_scripture_verse = load_journey["entry"]["scripture"]["reference"]
      @journey_latest_introduction = load_journey['entry']["scripture"]["html"]
      #@journey_scripture = 
      @journey_latest_key_verse_reference = load_journey['entry']['key_verse']['reference']
      @journey_latest_key_verse = load_journey['entry']['key_verse']['html']
      @journey_latest_central_truth = load_journey['entry']['central_truth']
      @journey_latest_devotional = load_journey['entry']['reflection']
      @journey_latest_author_name = load_journey['entry']['writer']['name']
      @journey_latest_author_twitter_handle = load_journey['entry']['writer']['twitter_handle']
      @journey_latest_author_bio = load_journey['entry']['writer']['bio']
      @journey_latest_author_picture = load_journey['entry']['writer']['picture']
      @title_tag =@journey_latest_title
    else
      @title_tag = ""
    end
  end

  # POST /contact
  def contact
    JtjMailer.contact(params).deliver
  end

end