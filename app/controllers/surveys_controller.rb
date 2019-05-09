class SurveysController < ApplicationController

  def survey
    render 'surveys/survey'
  end

  def summary
    render 'surveys/summary'
  end

  def about
    render partial: 'about'
  end
end
