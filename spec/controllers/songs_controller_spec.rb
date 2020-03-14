require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  describe "GET index" do
    context 'when there is no longged in user' do
      it "#index page" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
