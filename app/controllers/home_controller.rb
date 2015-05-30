class HomeController < ApplicationController
  def index
    @contests=Contest.all.order('created_at DESC').paginate(page: params[:page], per_page: 3)
    @modalName="#myModal"
    @posts = Post.all.order('created_at DESC').take(3)
  end
end
