class StaticController < ApplicationController

  def dashboard
    @jobs = Job.all
    @articles = Article.all
  end
end
