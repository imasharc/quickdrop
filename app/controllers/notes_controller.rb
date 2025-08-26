class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy, :toggle_sharing]
  
  def index
    @notes = current_user.notes.order(created_at: :desc)

    if params[:search].present?
      @notes = @notes.search(params[:search])
    end
    
    @notes = @notes.order(updated_at: :desc)
  end
  
  def show
  end
  
  def new
    @note = current_user.notes.build
  end
  
  def create
    @note = current_user.notes.build(note_params)
    
    if @note.save
      redirect_to notes_path, notice: 'Note saved!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @note.destroy
    redirect_to notes_path, notice: 'Note deleted!'
  end

  def toggle_sharing
    @note.update!(shareable: !@note.shareable?)
    
    if @note.shareable?
      flash[:notice] = "Note is now shareable!"
    else
      flash[:notice] = "Note sharing disabled"
    end
    
    redirect_back(fallback_location: notes_path)
  end
  
  private
  
  def set_note
    @note = current_user.notes.find(params[:id])
  end
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
end