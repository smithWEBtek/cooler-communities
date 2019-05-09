class ResponsesController < ApplicationController

  def create
 
    render json: params
  end
end
