require 'rails_helper'

RSpec.describe Api::V1::PortfoliosController, type: :request do
  describe 'GET /new' do
    before { get new_api_v1_portfolio_path }

    it 'Should return status 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /index' do
    before { get api_v1_portfolios_path }

    it 'Should return status 200 OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
