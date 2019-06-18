class LikesController < ApplicationController
  def index
    likes = Song.find(params['song_id']).likes
    render json: likes
  end
end

