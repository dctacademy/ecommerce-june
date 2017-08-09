class HomeController < ApplicationController
  def index
  	@categories = Category.all
  end

  def about 
  end
end
