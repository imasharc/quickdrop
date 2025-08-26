class SharedNotesController < ApplicationController
  def show
    @note = Note.find_by!(public_id: params[:id])
  
    if @note.nil?
      # Note doesn't exist at all
      render 'note_not_found', status: :not_found
    elsif !@note.shareable?
      # Note exists but sharing is disabled
      render 'sharing_disabled', status: :forbidden
    else
      # Note exists and is shareable = show it normally
      render 'show'
    end
  end
end