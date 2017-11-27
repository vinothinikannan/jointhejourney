# This class responds to Ajax requests from the javascript.
require 'date'
class AjaxController < ActionController::API

  # GET /ajax/fetch_next_week_entry
  def fetch_next_week_entry
    date=params['date']
    start_date=Date.parse(date)+1
    end_date=Date.parse(start_date.to_s)+6
    data = Entry.find_by_date(start_date,end_date)
    if data['entries'].present?
      next_date = data['entries'].last
      previous_date = data['entries'].first
      render json: {
        next_date: next_date['date'],
        previous_date: previous_date['date'],
        entry: data['entries']
      }
    else
      render json: {
        next_date:'',
        previous_date: '',
        entry: ''
      }
    end

  end

  # GET /ajax/fetch_previous_week_entry
  def fetch_previous_week_entry
    date=params['date']
    end_date=Date.parse(date)-1
    start_date=Date.parse(end_date.to_s)-6
    data = Entry.find_by_date(start_date,end_date)

    if data['entries'].present?
      next_date = data['entries'].last
      previous_date = data['entries'].first
      render json: {
        next_date: next_date['date'],
        previous_date: previous_date['date'],
        entry: data['entries']
      }
    else
      render json: {
        next_date: '',
        previous_date: '',
        entry: ''
      }
    end

  end

  # GET /ajax/fetch_tomorrow_entry
  def fetch_tomorrow_entry
    id=params['id']
    id=id.to_i+1
    data = Entry.find(id)

    if data['entry'].present?
      render json: {
        entry: data['entry']
      }
    else
      render json: {
        entry: ''
      }
    end

  end

  # GET /ajax/fetch_yesterday_entry
  def fetch_yesterday_entry
    id=params['id']
    id=id.to_i-1
    data = Entry.find(id)

    if data['entry'].present?
      render json: {
        entry: data['entry']
      }
    else
      render json: {
        entry: ''
      }
    end

  end

end