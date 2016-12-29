class BuildsController < ApplicationController

  before_action :set_build, only: [:show, :edit, :update, :destroy]

  def index
    @builds = Build.all
  end

  def new
    @build = Build.new(build_params)
  end


  def show

  end


  def edit
  end

  def create
    @build = Build.create(build_params)
    redirect_to @build.tab
  end

  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to @build.tab, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @build.tab, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    if @build.destroy
      flash[:success] = "Note was deleted."
    else
      flash[:error] = "Note could not be deleted."
    end
    redirect_to @build.tab
  end

  private

  def set_build
    @build = Build.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def build_params
    params.require(:build).permit(:tab_id, :name, :position)
  end

end
