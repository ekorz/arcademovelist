class MovesController < ApplicationController

  before_action :set_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.all
  end

  def new
    @move = Move.new(move_params)
  end


  def show
  end


  def edit
  end

  # POST /moves
  # POST /moves.json
  def create 
   @move = Move.create(move_params)
   redirect_to @move.character
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to @move.character, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    if @move.destroy
      flash[:success] = "Move was deleted."
    else
      flash[:error] = "Move could not be deleted."
    end
    redirect_to @move.character
  end

  private

    def set_move
      @move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:character_id, :name, :description)
    end

end

