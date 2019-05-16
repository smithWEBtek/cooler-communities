class StaticController < ApplicationController
  
  def about
    render partial: 'static/about'
  end

  def eventbrite
    render partial: 'static/eventbrite'
  end

  def img_url
    host_url = request.path == '/' ? request.url : request.original_url.split(request.path).first
    asset_path = ActionController::Base.helpers.asset_url("#{params[:id]}.png")
 
    render json: { 'url': host_url + asset_path }
  end
end
