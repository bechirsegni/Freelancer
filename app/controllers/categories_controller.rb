class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category].permit!)
    if @category.save
      redirect_to categories_url
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
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

end