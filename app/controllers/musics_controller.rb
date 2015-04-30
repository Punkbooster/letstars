class musicsController < ApplicationController

  def create
    @contest = Contest.find(params[:contest_id])
    @music = @contest.musics.create(params[:music].permit(:audio))
    #@music.user_id = current_user.id if current_user
    @music.save

    if @music.save
      redirect_to contest_path(@contest)
    else
      render 'new'
    end
  end

  def edit
    @contest = Contest.find(params[:contest_id])
    @music = @contest.musics.find(params[:id])
  end 

  def update
    @contest = Contest.find(params[:contest_id])
    @music = @contest.musics.find(params[:id])

    if @music.update(params[:music].permit(:audio))
      redirect_to contest_path(@contest)
    else
      render 'edit'
    end
  end

  def destroy
    @contest = Contest.find(params[:contest_id])
    @music = @contest.musics.find(params[:id])
    @music.destroy
    redirect_to contest_path(@contest)
  end

end
