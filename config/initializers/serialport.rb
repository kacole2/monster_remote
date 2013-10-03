
@comsettings = Comsetting.all
 begin
       $PORT = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
 rescue
       $CONNECTED = 'fail'
 else  
   $CONNECTED = 'pass'
    #this thread is necessary for keeping the ambient loop open
    #without this, the arduino is filling up with garbage and we can't send commands
    thread2 = Thread.new do
          while true do
              while (i = $PORT.gets.chomp) do 
                  #puts i
              end
          end
    end

 end
      