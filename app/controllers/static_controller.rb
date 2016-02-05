class StaticController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @jobs = Job.all
    @articles = Article.all
  end
end
