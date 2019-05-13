class ResponsesController < ApplicationController

  def create
    @responses = []
    params[:data].keys.each_with_index do |question_key, index|
      question = Question.find_by(question_key: question_key)
      answer = params[:data][question_key].downcase if params[:data][question_key]
      if question.answer_key.include?(params[:data][question_key])
        points = question.answer_key.include?(params[:data][question_key])
      end
      response_data = {
        user_id: current_user.id,
        question_id: question.id,
        answer: answer,
        points: points
      }
      new_response = Response.create(response_data)
      @responses.push(new_response)
    end
    render json: @responses
  end
end
