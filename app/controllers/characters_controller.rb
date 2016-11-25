class CharactersController < ApplicationController
  before_action :set_game
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  # GET /games/1
  # GET /games/1.json
  def show

  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @character = @game.characters.create(character_params)
    redirect_to @game
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character = @game.characters.find(params[:id])
    if @character.destroy
      flash[:success] = "Character was deleted."
    else
      flash[:error] = "Character could not be deleted."
    end
    redirect_to @game
  end

  private

    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_character
      @character = @game.characters.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :description)
    end

end