class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  # GET /games/1
  # GET /games/1.json

  def new
    @character = Character.new(character_params)
    
  end

  def show
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create 
   @character = Character.create(character_params)
   redirect_to @character.game
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character.game, notice: 'Character was successfully updated.' }
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
    redirect_to @character.game
  end

  private

    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:game_id, :name, :description)
    end

end