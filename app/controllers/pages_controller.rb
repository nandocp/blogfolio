class PagesController < ApplicationController
  def about
    text = 'about.text'.freeze
    @about = I18n.t!(text)
  rescue I18n::MissingTranslationData
    I18n.t(text, locale: :pt)
  end

  def portfolio
    @portfolio_entries = Portfolio.includes(:entry).all
  end

  def blog
    @blog_entries = Blog.includes(:entry).all
  end
end
