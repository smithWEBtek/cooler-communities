class QuestionsController < ApplicationController
  def index 
    @questions = Question.all
    @categories = Category.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @questions }
    end
  end
end
