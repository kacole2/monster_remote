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
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.write("@V")
    port.read_timeout = 2000
    garbageversion = port.read.to_s
    @msversion = garbageversion.delete "$VER="
   
  end
  
  def settings
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
  end
end
