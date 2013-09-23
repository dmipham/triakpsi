class NotesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @notes = Note.new
  end
  
  def create 
    Note.create(params[:note])
    redirect_to notes_path
  end
  
  def index
    @notes = Note.all
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
end