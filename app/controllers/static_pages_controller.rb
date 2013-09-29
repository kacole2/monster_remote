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

  end
  
  def settings
    @scenes = Scene.all
    @rasberry_pis = RasberryPi.all
  end
end
