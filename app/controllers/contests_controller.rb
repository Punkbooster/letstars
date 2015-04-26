class ContestsController < ApplicationController
  before_action :find_contest, only: [:show,:update,:edit,:destroy]
  def index
    @contests = Contest.all
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @contest=Contest.new
  end

  def create
    @contest=Contest.new(contest_params)
    if @contest.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def contest_params
      params.require(:contest).permit(:title,:image,:description)
    end

    def find_contest
      @contest=Contest.find(params[:id])
    end
  end

