class JobsController < ApplicationController
  before_action :set_job ,only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_cat ,only:[:new, :edit, :update, :destroy,:create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
      @jobs = Job.all
      @jobs = @jobs.tagged_with(params[:tag]) if params[:tag]
      @jobs = @jobs.search(params[:search]).order("created_at DESC") if params[:search]
      @category_id = Category.find_by(name: params[:category].to_s)
      @jobs = Job.where(category_id: @category_id).order("created_at DESC") if   params[:category]
  end

  def new
  end

  def show
  end

  def create
    @job = current_user.jobs.build(jobs_params)
      if @job.save!
        redirect_to @job, notice: "Job Successfully Created"
      else
        render :new
      end
  end

  def edit

  end

  def worker
    @job = Job.find params[:job_id]
    @bid = Bid.find params[:bid_id]
    if @job.worker.nil?
      redirect_to projects_path if @job.update_attributes worker: @bid.user.id
    else
      redirect_to projects_path , notice: "#{@bid.user.name} assigned on this project"
    end
  end

  def update
    if @job.update(jobs_params)
      redirect_to job_path , notice: "Job Successfully Modified"
    else
      render :edit
    end
  end

  def destroy
     if @job.destroy!
       redirect_to projects_path
     else
       redirect_to job_path
     end
  end

  private

  def set_job
  @job = Job.find(params[:id])
  end

  def set_cat
    @job = current_user.jobs.build
  end

  def jobs_params
    params.require(:job).permit(:title,:description,:price,:duration,:location,:category_id,:document,:tag_list,:worker)
  end

  def correct_user
    @job = current_user.jobs.find_by_id(params[:id])
    redirect_to jobs_path, notice: "Not authorized to edit this job" if @job.nil?
  end
end
