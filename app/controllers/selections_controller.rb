class SelectionsController < ApplicationController

  def index 
    @selections = Selection.all
  end

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new(params: "text")
    if @selection.save
      render json: @selection
    else
      render :new
    end
  end
end
