class JobsController < ApplicationController
  before_filter :set_job ,only:[:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:tags].present?
      @jobs = Job.tagged_with(params[:tags])
    else
      @jobs = Job.all
    end
  end

  def new
    @job = current_user.jobs.build
  end

  def show
  end

  def create
    @job = current_user.jobs.build(jobs_params)
      if @job.save!
        redirect_to @job
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @job.update(jobs_params)
      redirect_to job_path
    else
      render :edit
    end
  end

  def destroy
     if @job.destroy!
      redirect_to jobs_path
     else
       redirect_to job_path
     end
  end

  private

  def set_job
  @job = Job.find(params[:id])
  end

  def jobs_params
    params.require(:job).permit(:title,:description,:price,:duration,:location,:category_id,:document,:tag_list)
  end

  def correct_user
    @job = current_user.jobs.find_by_id(params[:id])
    redirect_to jobs_path, notice: "Not authorized to edit this job" if @job.nil?
  end
end
