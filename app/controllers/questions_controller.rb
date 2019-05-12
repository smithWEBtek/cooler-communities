class QuestionsController < ApplicationController
  def index 
    @questions = Question.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @questions }
    end
  end
end
