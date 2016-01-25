class JobsController < ApplicationController
  before_filter :set_job ,only:[:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
  end

  def create
    @job = Job.create(jobs_params)
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
    params.require(:job).permit(:title,:description,:price,:duration,:location,:category_id)
  end
end
