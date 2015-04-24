class HomeController < ApplicationController
  def index
    @contests=Contest.all.order('created_at DESC').take(3)
    @modalName="#myModal"
  end
end
