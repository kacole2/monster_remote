class RasberryPisController < ApplicationController
  before_action :set_rasberry_pi, only: [:show, :edit, :update, :destroy]

  # GET /rasberry_pis
  # GET /rasberry_pis.json
  def index
    @rasberry_pis = RasberryPi.all
    @comsettings = Comsetting.all
  end

  # GET /rasberry_pis/1
  # GET /rasberry_pis/1.json
  def show
  end
  
  def shutdown
    @rasberry_pis = RasberryPi.all
    $PORT.close
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
  # at this time, the application only supports 1 pi
=begin
 
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

=end 


  # PATCH/PUT /rasberry_pis/1
  # PATCH/PUT /rasberry_pis/1.json
  def update
    respond_to do |format|
      if @rasberry_pi.update(rasberry_pi_params)
        format.html { redirect_to :rasberry_pis, notice: 'Rasberry pi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rasberry_pi.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def reconnect_to_arduino
    @comsettings = Comsetting.all
    begin
       $PORT = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    rescue
       $CONNECTED = "fail"
       redirect_to :changecomsettings
    else 
    $CONNECTED = "pass"
    #this thread is necessary for keeping the ambient loop open
    #without this, the arduino is filling up with garbage and we can't send commands
      thread2 = Thread.new do
          while true do
              while (i = $PORT.gets.chomp) do 
                  #puts i
              end
          end
      end
    redirect_to :back
    end
  end
  # DELETE /rasberry_pis/1
  # DELETE /rasberry_pis/1.json
  # we can't have any mistakes now, can we?
=begin
  
  def destroy
    @rasberry_pi.destroy
    respond_to do |format|
      format.html { redirect_to rasberry_pis_url }
      format.json { head :no_content }
    end
  end
  
=end


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


