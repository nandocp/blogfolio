require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /about" do
    before { get about_path }

    it 'SHould return status 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /blog" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "GET /portfolio" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
