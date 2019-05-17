class ResponsesController < ApplicationController
 		
  def index
		case
		when params[:category] == 'yard'
      @responses = Response.yard
		when params[:category] == 'weatherization'
      @responses = Response.weatherization
		when params[:category] == 'heating'
      @responses = Response.heating
		when params[:category] == 'water'
      @responses = Response.water
		when params[:category] == 'solar'
      @responses = Response.solar
		when params[:category] == 'lighting'
      @responses = Response.lighting
		when params[:category] == 'appliances'
      @responses = Response.appliances
		when params[:category] == 'transportation'
      @responses = Response.transportation
		when params[:category] == 'eating'
      @responses = Response.eating
		when params[:category] == 'recycle'
      @responses = Response.recycle
		else
      @responses = Response.all
    end
      render json: @responses
  end

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
