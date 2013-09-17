class StaticPagesController < ApplicationController
  def home
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
    @scenenumber = Scene.all
   
  end

  def help
  end

  def contact
  end

  def about
    @comsettings = Comsetting.all
    begin
      port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    rescue
       redirect_to :changecomsettings
    else
    port.write("@V")
    port.read_timeout = 2000
    garbageversion = port.read.to_s
    @msversion = garbageversion.delete "$VER="
    end
  end
  
  def settings
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
  end
end
