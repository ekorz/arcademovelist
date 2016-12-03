class SetupsController < ApplicationController

  before_action :set_setup, only: [:show, :edit, :update, :destroy]

  def index
    @setups = Setup.all
  end

  def new
    @setup = Setup.new(setup_params)
  end


  def show
    
  end


  def edit
  end

  def create 
   @setup = Setup.create(setup_params)
   redirect_to @setup.tab.tabable
  end

  def update
    respond_to do |format|
      if @setup.update(setup_params)
        format.html { redirect_to @setup.tab.tabable, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setup.tab.tabable, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    if @setup.destroy
      flash[:success] = "Note was deleted."
    else
      flash[:error] = "Note could not be deleted."
    end
    redirect_to @setup.tab.tabable
  end

  private

    def set_setup
      @setup = Setup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setup_params
      params.require(:setup).permit(:tab_id, :jamma, :kick_harness, :button_layout, :region)
    end

end

