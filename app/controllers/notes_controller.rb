class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new(note_params)
  end


  def show
    
  end


  def edit
  end

  def create 
   @note = Note.create(note_params)
   redirect_to @note.tab.tabable
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note.tab.tabable, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.tab.tabable, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    if @note.destroy
      flash[:success] = "Note was deleted."
    else
      flash[:error] = "Note could not be deleted."
    end
    redirect_to @note.tab.tabable
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:tab_id, :description)
    end

end

