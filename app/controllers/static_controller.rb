class StaticController < ApplicationController
  def about
    render partial: 'static/about'
  end

  def eventbrite
    render partial: 'static/eventbrite'
  end
end