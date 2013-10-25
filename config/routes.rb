BabyNames::Application.routes.draw do

  root :to => 'welcome#index'

  get '/babynames' => 'babynames#index'
  get '/babynames/search' => 'babynames#search'

end
