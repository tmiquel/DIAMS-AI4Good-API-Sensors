require 'rails_helper'

RSpec.describe "LastData", type: :request do
  describe "GET /last_data" do
    it "works! (now write some real specs)" do
      get last_data_path
      expect(response).to have_http_status(200)
    end
  end
end
