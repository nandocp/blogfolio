class Api::V1::PortfoliosController < Api::BaseController
  def new
    @portfolio = Portfolio.new
    @entry = Entry.new(portfolio: @portfolio)
  end

  def index
    @portfolios = Portfolio.includes(:entry).all
  end
end
