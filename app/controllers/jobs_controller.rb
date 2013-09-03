class JobsController < ApplicationController
  
 before_filter :authenticate_user!
 
  def new
    @job = Job.new
    
    @name = current_user[:first_name] + " " + current_user[:last_name]
    @position = current_user[:position]
    @company = current_user[:company]
    @email = current_user[:email]
    
  end
  
  def create
    Job.create(params[:job])
    redirect_to jobs_path
  end
  
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
end