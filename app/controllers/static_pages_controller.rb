class StaticPagesController < ApplicationController
  def home
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
  end

  def help
  end

  def contact
  end

  def about
    
    #port_str = "/dev/ttyUSB0"  #may be different for you
    #baud_rate = 9600
    #data_bits = 8
    #stop_bits = 1
    #parity = SerialPort::NONE
    #sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    
    port = SerialPort.new( '/dev/ttyUSB0', 9600 )
    port.puts "@V"
    @msversion = port.gets.chomp
    #@msversion = "This will be a version #"
    
   
  end
  
  def settings
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
  end
end
