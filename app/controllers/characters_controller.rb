class CharactersController < ApplicationController

  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new(character_params)
  end

  def show
  end

  def edit
  end

  def create 
   @character = Character.create(character_params)
   redirect_to @character.tab.tabable
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character.tab.tabable, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    if @character.destroy
      flash[:success] = "Character was deleted."
    else
      flash[:error] = "Character could not be deleted."
    end
    redirect_to @character.tab.tabable
  end

  private

    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:tab_id, :name, :description)
    end

end