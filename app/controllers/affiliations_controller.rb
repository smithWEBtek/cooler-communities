class AffiliationsController < ApplicationController
  before_action :set_affiliation, only: [:show, :update, :destroy]

  def index
    @affiliations = Affiliations.all
  end

  def show
  end

  def new
    @affiliation = Affiliation.new
  end
  
  def create
    @affiliation = Affiliation.find(affiliation_params)
    if @affiliation.save
      redirect_to affiliations_path
    else
      render :new
    end
  end
  
  def update
    if @affiliation.update(affiliation_params)
      redirect_to affiliations_path
    else
      render :edit
    end
  end
  
  def destroy
    redirect_to affiliations_path
  end

  private

  def set_affiliation
    @affiliation = Affiliation.find(params[:id])
  end

  def affiliation_params
    require(:affiliation).permit(:name)
  end
end
