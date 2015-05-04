class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  before_action :load_contest
  

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
   
    @music.user_id = current_user.id
    @music.contest_id=@contest.id
   
    if @music.save
      redirect_to contest_path(@contest)
    else
      render 'new'
    end
  end


  def update
    @music = @contest.musics.find(params[:id])

    if @music.update(params[:music].permit(:audio))
      redirect_to contest_path(@contest)
    else
      render 'edit'
    end
  end

  def destroy
    @music = @contest.musics.find(params[:id])
    @music.destroy
    redirect_to contest_path(@contest)
  end

  def audio_download
   @music = Music.find(params[:id])
   file_path = @music.audio_file_name
   if !file_path.nil?
    send_file "#{Rails.root}/public/system/audios/#{@music.id}/original/#{file_path}", :x_sendfile => true
  else
   redirect_to musics_url
  end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_params
      params.require(:music).permit(:audio)
    end

    def load_contest
      @contest = Contest.find(params[:contest_id])
    end
end
