class RasberryPisController < ApplicationController
  before_action :set_rasberry_pi, only: [:show, :edit, :update, :destroy]

  # GET /rasberry_pis
  # GET /rasberry_pis.json
  def index
    @rasberry_pis = RasberryPi.all
  end

  # GET /rasberry_pis/1
  # GET /rasberry_pis/1.json
  def show
  end
  
  def shutdown
    @rasberry_pis = RasberryPi.all
    # require 'net/ssh'
    
    Net::SSH.start(@rasberry_pis.first.ipdns, @rasberry_pis.first.username, :password => @rasberry_pis.first.password) do |ssh|
      ssh.exec "sudo shutdown -h now"
    end

  end
  
  # GET /rasberry_pis/new
  def new
    @rasberry_pi = RasberryPi.new
  end

  # GET /rasberry_pis/1/edit
  def edit
  end

  # POST /rasberry_pis
  # POST /rasberry_pis.json
  def create
    @rasberry_pi = RasberryPi.new(rasberry_pi_params)

    respond_to do |format|
      if @rasberry_pi.save
        format.html { redirect_to @rasberry_pi, notice: 'Rasberry pi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rasberry_pi }
      else
        format.html { render action: 'new' }
        format.json { render json: @rasberry_pi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rasberry_pis/1
  # PATCH/PUT /rasberry_pis/1.json
  def update
    respond_to do |format|
      if @rasberry_pi.update(rasberry_pi_params)
        format.html { redirect_to @rasberry_pi, notice: 'Rasberry pi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rasberry_pi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rasberry_pis/1
  # DELETE /rasberry_pis/1.json
  def destroy
    @rasberry_pi.destroy
    respond_to do |format|
      format.html { redirect_to rasberry_pis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rasberry_pi
      @rasberry_pi = RasberryPi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rasberry_pi_params
      params.require(:rasberry_pi).permit(:ipdns, :username, :password)
    end
end
