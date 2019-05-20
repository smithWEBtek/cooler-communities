class SurveysController < ApplicationController
  def survey
    render 'surveys/survey'
  end

  def summary
    render 'surveys/summary'
  end
end
