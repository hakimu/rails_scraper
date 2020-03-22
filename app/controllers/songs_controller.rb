class SongsController < ApplicationController
  before_action :confirm_login
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /songs
  # GET /songs.json
  def index
    @songs = current_user.songs
    @songs_this_week = Song.week_of_songs
    respond_with(@songs)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    respond_with(@song)
  end

  # GET /songs/1/edit
  def edit
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def confirm_login
    unless current_user
      redirect_to root_path, alert: 'You must log in.'
    end
  end
end
