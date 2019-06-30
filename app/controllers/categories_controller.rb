class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @categories = Category.all.sort_by {|c| [c.created_at, c.id]}
    else
      @categories = current_user.categories.sort_by {|c| [c.created_at, c.id]}
    end
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @categories }
    end
  end

  def show
     respond_to do |f|
      f.html { render :show }
      f.json { render json: @category }
    end
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = "Category created."
      redirect_to user_path(current_user)
    else
      flash[:notice] = @category.errors.full_messages
      render 'categories/new'
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:message] = "Category was updated."
      redirect_to category_path(@category)
    else
      flash[:message] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @category.delete
      flash[:notice] = "Category deleted"
      redirect_to home_path
    else 
      flash[:notice] = @category.errors.full_messages
      redirect_to category_path(@category)
    end
  end

  private
    def set_category 
      @category = Category.find_by_id(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
