require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  describe "GET index" do
    context 'when there is not a logged in user' do
      it "redirects to the home page for login" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
    context 'when there is a loggin in user' do
      it 'returns songs' do
        login_user
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
  describe 'GET show' do
    context 'when the logged in user is different from the song user' do
      it 'raises a NotAuthForSongError exception' do
        login_user
        non_logged_in_user = create(:user)
        non_logged_in_user.songs << create(:song)
        params = { user_id: non_logged_in_user.id, id: non_logged_in_user.songs.ids.first }
        get :show, params
        expect(response).to have_http_status(401)
      end
    end
    context 'when the logged in user is the same as the song user' do
      it 'returns a successfull response' do
        # not sure why using login_user didn't work. login_user.songs << create(:song) didn't save songs.
        login_user_test = create(:user)
        session[:user_id] = login_user_test.id
        login_user_test.songs << create(:song)
        params = { user_id: login_user_test.id, id: login_user_test.songs.ids.first }
        get :show, params
        expect(response).to have_http_status(:success)
      end
    end
  end
  def login_user
    user = create(:user)
    session[:user_id] = user.id
    user
  end
end
