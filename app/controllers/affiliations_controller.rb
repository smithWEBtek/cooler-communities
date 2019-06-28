class AffiliationsController < ApplicationController
  before_action :set_affiliation, only: [:show, :update, :destroy]

  def index
    @affiliations = Affiliation.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @affiliations }
    end
  end

  def show
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @affiliation }
    end
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
    @affiliation.delete
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
