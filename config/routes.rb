BabyNames::Application.routes.draw do

  root :to => 'welcome#index'
  get '/display' => 'welcome#display'

  get '/babynames/search' => 'babynames#search'

end
