class StaticPagesController < ApplicationController
  def home
    $scenes = Scene.all
  end

  def help
  end

  def contact
  end

  def about
  end
  
end
