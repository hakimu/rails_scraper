# frozen_string_literal: true

class RatingsController < ApplicationController
  def index
    ratings = Song.find(params['song_id']).ratings
    render json: ratings
  end
end
