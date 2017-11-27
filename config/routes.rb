Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'index'
  root to: "pages#home"
  get 'home' => redirect('/')

  #post requests
  post '/contact' => 'pages#contact' # contact page email

  # Journal entries
  get '/:id-:slug', to: 'pages#entry',constraints: { id: /\d+/ }

  #OAUTH Call Back URL
  get '/callback', to: 'wmoauth#create' 

  #ajax requests
  get '/ajax/fetch_next_week_entry' => 'ajax#fetch_next_week_entry'
  get '/ajax/fetch_previous_week_entry' => 'ajax#fetch_previous_week_entry'
  get '/ajax/fetch_tomorrow_entry' => 'ajax#fetch_tomorrow_entry'
  get '/ajax/fetch_yesterday_entry' => 'ajax#fetch_yesterday_entry'

  # calendar
  resources :calendar, only: %i[index show], constraints: { id: /\d+/ }
  # pages
  get '/:slug', to: 'pages#show'

end