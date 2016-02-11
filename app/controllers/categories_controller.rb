class CategoriesController < ApplicationController
  before_filter :set_category ,only:[:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_url
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(params[:category].permit!)
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name,:parent_id)
  end
end