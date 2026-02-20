require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /about" do
    before { get about_path }

    it 'Should return status 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should be processed by the correct action' do
      expect(@controller.action_name).to eq('about')
    end

    it 'Should return the correct view' do
      expect(response.body).to include("id='about-me'")
    end
  end

  describe "GET /blog" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "GET /portfolio" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
