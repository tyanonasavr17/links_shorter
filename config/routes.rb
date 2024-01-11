Rails.application.routes.draw do

  root 'urls#index'

  post '/urls', to: 'urls#create'
  get '/urls', to: 'urls#all_urls'
  get '/urls/:short_url', to: 'urls#show'
  get '/urls/:short_url/stats', to: 'urls#stats'
end
