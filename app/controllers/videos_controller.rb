class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def create
    @video = current_user.videos.create!(video_params)
  end

  def update
    @video = current_user.videos.find(params[:id])
    @video.update(video_params)
  end

  def destroy
    current_user.videos.find(params[:id]).destroy!
    render json: {}
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :uri)
  end
end
