class WelcomeController < ApplicationController

  # root :to => 'welcome#index'
  def index
    @years = (1990..2012).to_a
    render "display"
  end

  # get '/display' => 'welcome#display'
  def display
    @years = (1990..2012).to_a
    @girl_names = Babyname.where(birth_year: params[:year], gender: "F")
    # @boy_names = Babyname.where(birth_year: params[:year], gender: "M")[0...100]
  end

end