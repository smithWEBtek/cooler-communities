class ResponsesController < ApplicationController

  def create
    @response = Response.new

    
    binding.pry
  end
end
