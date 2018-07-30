class NewsController < ApplicationController
  def index
    # @events = Ahoy::Event.where_properties(title: params[:token])
    # @visits = Visit.joins(:ahoy_events).where(:ahoy_events=>{:properties => {title: params[:token]}})
    @today_news_sites = Ahoy::Visit.count
    @today_news_articles = Ahoy::Event.count    
  end
end
