class NewsController < ApplicationController
  def index
    # @events = Ahoy::Event.where_properties(title: params[:token])
    # @visits = Visit.joins(:ahoy_events).where(:ahoy_events=>{:properties => {title: params[:token]}})
    @news_sites = Ahoy::Visit.all
    @news_articles = Ahoy::Event.all    
    @site_details = SiteDetail.all
  end
end
