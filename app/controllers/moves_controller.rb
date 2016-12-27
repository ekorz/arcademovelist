class MovesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:sort]
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.order('moves.position ASC')
  end

  def sort

    param = params[:tab_id]

    @moves = Move.where("tab_id = '#{param}'")

    @moves.each do |move|
      move.position = params['move'].index(move.id.to_s) + 1
      move.save
      end
    render :nothing => true
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
   redirect_to @move.tab.tabable
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to @move.tab.tabable, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @move.tab.tabable, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    if @move.destroy
      flash[:success] = "Move was deleted."
    else
      flash[:error] = "Move could not be deleted."
    end
    redirect_to @move.tab.tabable
  end

  private

    def set_move
      @move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:tab_id, :name, :description, :position)
    end

end

