class SinglescenesController < ApplicationController
  before_action :set_singlescene, only: [:show, :edit, :update, :destroy]
  
  # GET /singlescenes
  # GET /singlescenes.json
  def index
    @singlescenes = Singlescene.all
    @scenes = Scene.all
       
  end

  # GET /singlescenes/1
  # GET /singlescenes/1.json
  def show
  end

  # GET /singlescenes/new
  def new
    @singlescene = Singlescene.new
  end

  # GET /singlescenes/1/edit
  def edit
  end

  # POST /singlescenes
  # POST /singlescenes.json
=begin
  def create
    @singlescene = Singlescene.new(singlescene_params)

    respond_to do |format|
      if @singlescene.save
        format.html { redirect_to @singlescene, notice: 'Singlescene was successfully created.' }
        format.json { render action: 'show', status: :created, location: @singlescene }
      else
        format.html { render action: 'new' }
        format.json { render json: @singlescene.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # PATCH/PUT /singlescenes/1
  # PATCH/PUT /singlescenes/1.json
  def update
   begin
    respond_to do |format|
      if @singlescene.update(singlescene_params)
        
        firstchar = @singlescene.slot.first
        @comsettings = Comsetting.all
        $PORT.write("@S" + firstchar.to_s)
        sleep 2
        $PORT.write("@P2")
        
        format.html { redirect_to @singlescene, notice: 'Single Mode has been enabled on ' + firstchar.to_s }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @singlescene.errors, status: :unprocessable_entity }
      end
    end
   rescue
        $CONNECTED = 'fail'
        redirect_to :changecomsettings
   else   
   end
  end

=begin
  # DELETE /singlescenes/1
  # DELETE /singlescenes/1.json
  def destroy
    @singlescene.destroy
    respond_to do |format|
      format.html { redirect_to singlescenes_url }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_singlescene
      @singlescene = Singlescene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def singlescene_params
      params.require(:singlescene).permit(:slot)
    end
end
