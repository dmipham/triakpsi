class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  def create
    Job.create(params[:job])
    redirect_to members_path
  end
  
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
end