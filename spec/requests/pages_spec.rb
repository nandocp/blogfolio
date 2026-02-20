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
    before(:all) do
      create_list(:blog_entry, 15)
      get blog_path
    end

    it 'Should return status 200 OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should be processed by the correct action' do
      expect(@controller.action_name).to eq('blog')
    end

    it 'Should return the correct view' do
      expect(response.body).to include("id='blog-posts'")
    end

    it 'Should return the correct number of entries' do
      _test = @controller.instance_variable_get(:@blog_entries)
      expect(_test.length).to eq(15)
      expect(_test.all? { |entry| entry.is_a?(Blog) }).to be_truthy
    end
  end

  describe "GET /portfolio" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
