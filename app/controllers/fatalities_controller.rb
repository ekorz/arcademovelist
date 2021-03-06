class FatalitiesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:sort]
  before_action :set_fatality, only: [:show, :edit, :inline_update, :update, :destroy]

  def index
    @fatalitys = Fatality.all
  end

  def inline_update
    
    @fatality.send("#{params[:field]}=",params[:value])
    @fatality.save
    render json: {success: true}

  end

  def sort
    param = params[:tab_id]

    @fatalities = Fatality.where("tab_id = '#{param}'")

    @fatalities.each do |fatality|
      fatality.position = params['fatality'].index(fatality.id.to_s) + 1
      fatality.save
    end
    render :nothing => true
  end

  def new
    @fatality = Fatality.new(fatality_params)
  end

  def show

  end


  def edit
  end

  # POST /fatalitys
  # POST /fatalitys.json
  def create
    @fatality = Fatality.create(fatality_params)
    redirect_to @fatality.tab.tabable
  end

  # PATCH/PUT /fatalitys/1
  # PATCH/PUT /fatalitys/1.json
  def update
    respond_to do |format|
      if @fatality.update(fatality_params)
        format.html { redirect_to @fatality.tab.tabable, notice: 'fatality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fatality.tab.tabable, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    if @fatality.destroy
      flash[:success] = "fatality was deleted."
    else
      flash[:error] = "fatality could not be deleted."
    end
    redirect_to @fatality.tab.tabable
  end

  private

  def set_fatality
    @fatality = Fatality.find(params[:id]||params[:character_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fatality_params
    params.require(:fatality).permit(:tab_id, :name, :description, :position)
  end

end
