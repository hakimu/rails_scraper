require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  describe "GET index" do
    it "#index page" do
      get :index
      expect(response.code).to eq "200"
    end
  end
end
