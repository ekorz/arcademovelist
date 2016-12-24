class TabsController < ApplicationController
  helper :tabs
  skip_before_action :verify_authenticity_token, only: [:sort]
	before_action :set_tab, only: [:show, :edit, :update, :destroy]


  def index
    @tabs = Tab.order('tabs.position ASC')
  end

  def sort
    @tabs = Tab.all
      
    @tabs.each do |tab|
      tab.position = params['tab'].index(tab.id.to_s) + 1
      tab.save
      end
    render :nothing => true
  end

  def edit
  end

  def show
  end


  def create

    @tab = Tab.new(tab_params)

    respond_to do |format|
      if @tab.save
        format.html { redirect_to @tab.tabable, notice: 'Tab was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tab.tabable }
      else
        format.html { render action: 'new' }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @tab.update(tab_params)
        format.html { redirect_to @tab.tabable, notice: 'Tab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @tab.destroy
    respond_to do |format|
      format.html { redirect_to @tab.tabable }
      format.json { head :no_content }
    end
  end

  def new
    @tab = Tab.new(tab_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tab
      @tab = Tab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tab_params
      params.require(:tab).permit(:tabable_id, :tabable_type, :tab_type, :position,
        moves_attributes: [:id, :name, :description, :_destroy],
        fatalities_attributes: [:id, :name, :description, :_destroy],
        characters_attributes: [:id, :name, :description, :_destroy])
    end
end
