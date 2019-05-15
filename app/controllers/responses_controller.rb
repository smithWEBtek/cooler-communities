class ResponsesController < ApplicationController

  def create
    @responses = []
    category_points = 0

    params[:data].keys.each_with_index do |question_key, index|
      question = Question.find_by(question_key: question_key)
      answer = question.answer_key.keys[0]
      points = question.answer_key[answer]
      response_data = {
        user_id: current_user.id,
        question_id: question.id,
        answer: answer,
        points: points
      }

      new_response = Response.create(response_data)
      category_points += points
      @responses.push(new_response)
    end
    render json: { 
      category: params[:category],
      responses: @responses, 
      category_points: category_points }
  end
end
