class ComsettingsController < ApplicationController
  before_action :set_comsetting, only: [:show, :edit, :update, :destroy]

  # GET /comsettings
  # GET /comsettings.json
  def index
    @comsettings = Comsetting.all
  end

  # GET /comsettings/1
  # GET /comsettings/1.json
  def show
  end

  # GET /comsettings/new
  def new
    @comsetting = Comsetting.new
  end


  # GET /comsettings/1/edit
  def edit
  end

  # POST /comsettings
  # POST /comsettings.json
=begin
  
  def create
    @comsetting = Comsetting.new(comsetting_params)

    respond_to do |format|
      if @comsetting.save
        format.html { redirect_to @comsetting, notice: 'Comsetting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comsetting }
      else
        format.html { render action: 'new' }
        format.json { render json: @comsetting.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # PATCH/PUT /comsettings/1
  # PATCH/PUT /comsettings/1.json
  def update
    respond_to do |format|
      if @comsetting.update(comsetting_params)
        format.html { redirect_to @comsetting, notice: 'Comsetting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comsetting.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
=begin

  # DELETE /comsettings/1
  # DELETE /comsettings/1.json
  def destroy
    @comsetting.destroy
    respond_to do |format|
      format.html { redirect_to comsettings_url }
      format.json { head :no_content }
    end
  end

  
=end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comsetting
      @comsetting = Comsetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comsetting_params
      params.require(:comsetting).permit(:comport, :baud)
    end
end
