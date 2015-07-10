class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show,:update,:edit,:destroy]
  before_action :authenticate_user!
  before_action :admin_validation, only: [:destroy]

  def new
    if Profile.where(user_id: current_user.id).count == 0
      @profile=Profile.new
    else
      redirect_to root_path
    end

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
    @musics=Music.where(user_id: @profile.user_id)
  end

  def edit
    if @profile.user_id != current_user.id
      redirect_to @profile
    else

    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy

    @profile.destroy
    redirect_to root_path
  end

  private

    def profile_params
      params.require(:profile).permit(:name,:surname,:band,:role,:about,:photo)
    end

    def find_profile
      @profile=Profile.find(params[:id])
    end

    def admin_validation
      if current_user.role !='administrator'
        redirect_to root_path
      end
    end

end
