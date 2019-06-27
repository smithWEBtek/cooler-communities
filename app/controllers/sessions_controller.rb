class SessionsController < ApplicationController
  def new
      # nothing to do here!
  end

  def create
      session[:email] = params[:email]
      redirect_to '/'
  end
end
