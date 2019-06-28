class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index 
    @questions = Question.all
    @categories = Category.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @questions }
    end
  end
  
  def show
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @question }
    end
  end

  private 

  def set_question
    @question = Question.find(params[:id])
  end
end



