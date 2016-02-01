class ShowcasesController < ApplicationController
  before_filter :set_showcase ,only:[:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @showcases = Showcase.all
  end

  def show
  end

  def new
    @showcase = current_user.showcases.build
  end

  def create
    @showcase = current_user.showcases.build(showcase_params)
    if @showcase.save!
      redirect_to showcases_path(@showcases), notice: "Showcase Successfully Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @showcase.update(showcase_params)
      redirect_to @showcases, notice: "Showcase Successfully Modified"
    else
      render :edit
    end
  end

  def destroy
    @showcase.destroy!
    redirect_to root_path
  end

  private

  def set_showcase
    @showcase = Showcase.find(params[:id])
  end

  def showcase_params
    params.require(:showcase).permit(:title,:description,:photo)
  end

  def correct_user
    @showcase = current_user.showcases.find_by_id(params[:id])
    redirect_to showcases_path, notice: "Not authorized to edit this showcase" if @showcase.nil?
  end
end