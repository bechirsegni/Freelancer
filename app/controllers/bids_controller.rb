class BidsController < ApplicationController
  before_action :set_bid, only: [:create, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]


  def create
    @bid = @job.bids.create(bid_params)
    @bid.user = current_user
    if @bid.save
      redirect_to job_path(@job)
    end
  end


  def destroy
    @bid.destroy
    redirect_to @job
  end

  private
  def set_bid
    @job = Job.find(params[:job_id])
  end

  def bid_params
    params.require(:bid).permit(:price,:time,:proposal)
  end

  def correct_user
    @bid = current_user.bids.find_by(id: params[:id])
    redirect_to job_path, notice: "Not authorized to destroy this bid" if @bid.nil?
  end
end
