class ScenesController < ApplicationController

  before_action :set_scene, only: [:show, :edit, :update, :destroy]

  # GET /scenes
  # GET /scenes.json
  def index
    
    @comsettings = Comsetting.all
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.write("@O")
    port.read_timeout = 3000
    garbagescenes = port.read.to_s
    @monsterscenes = garbagescenes.delete "$O"
    
    @scenes = Scene.all
        
    @scenes.each do |scene|
     # puts scene.id
      if @monsterscenes[scene.id - 1] =="1"
       # puts "I TRUE"
        scene.enabled = true
        scene.save
      else
      #elsif @monsterscenes[scene.id - 1] =="0"
      #  puts "I'M FALSE"
        scene.enabled = false
        scene.save
      end
    end
  end
  
  # GET /scenes/1
  # GET /scenes/1.json
  def show
  end

  # GET /scenes/new
  def new
    @scene = Scene.new
  end

  # GET /scenes/1/edit
  def edit
    
  end

  # POST /scenes
  # POST /scenes.json
  
  #remove ability to create more scenes
=begin
  
 
  def create
    @scene = Scene.new(scene_params)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to @scene, notice: 'Scene was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scene }
      else
        format.html { render action: 'new' }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

=end 

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update

    respond_to do |format|
     
      if @scene.update(scene_params)
            
            @scenenumber = @scene.id - 1
              if (@scene.id - 1).to_s == "10"      
                 @scenenumber = "A"  
              elsif (@scene.id - 1).to_s == "11"
                 @scenenumber = "B"
              elsif (@scene.id - 1).to_s == "12"
                 @scenenumber = "C"
              elsif (@scene.id - 1).to_s == "13"
                 @scenenumber = "D"
              elsif (@scene.id - 1).to_s == "14"
                  @scenenumber = "E" 
              end
            
            @comsettings = Comsetting.all
            port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
            
           if @scene.enabled
             port.write("@+" + @scenenumber.to_s)
            else
             port.write("@-" + @scenenumber.to_s)
            end
        
        format.html { redirect_to @scene, notice: 'Scene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /scenes/1
  # DELETE /scenes/1.json
  # we can't have any mistakes
=begin
  
  def destroy
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to scenes_url }
      format.json { head :no_content }
    end
  end

=end

  #This will tell a button tos send a command to the arduino to start a scene
  def invokescene
    # require 'serialport'
    sceneid = "@T" + (params[:id].to_i-1).to_s
    
    if (params[:id].to_i-1).to_s == "10"
        sceneid = "@TA"
     elsif (params[:id].to_i-1).to_s == "11"
        sceneid = "@TB"
     elsif (params[:id].to_i-1).to_s == "12"
        sceneid = "@TC"
     elsif (params[:id].to_i-1).to_s == "13"
        sceneid = "@TD"
     elsif (params[:id].to_i-1).to_s == "14"
        sceneid = "@TE"
    end
    @comsettings = Comsetting.all
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.puts sceneid
    redirect_to :back 
      
  end
  
  def stop_animation
    @comsettings = Comsetting.all
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.write("@*")
    
    redirect_to :back
  end

  def stop_ambient
    @comsettings = Comsetting.all
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.write("@A0")
    
    redirect_to :back
  end
  
  def start_ambient
    @comsettings = Comsetting.all
    port = SerialPort.new(@comsettings.first.comport,@comsettings.first.baud)
    port.write("@A1")
    
    redirect_to :back
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene_params
      params.require(:scene).permit(:name, :enabled)
    end
end


