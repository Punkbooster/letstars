class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show,:update,:edit,:destroy]

  def new
    @profile=Profile.new
  end

  def create
    @profile=Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
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

    def profile_params
      params.require(:profile).permit(:name,:surname,:band,:role,:about,:photo)
    end

    def find_profile
      @profile=Profile.find(params[:id])
    end


end
