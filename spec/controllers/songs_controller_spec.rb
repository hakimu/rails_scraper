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
        user = create(:user)
        session[:user_id] = user.id
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
