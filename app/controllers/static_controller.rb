class StaticController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @articles = Article.all
  end

  def myprojects
    @jobs = current_user.jobs.paginate(:page => params[:page], :per_page => 10).order("id DESC")
    @bids = current_user.bids.paginate(:page => params[:page], :per_page => 10).order("id DESC")
  end

end
