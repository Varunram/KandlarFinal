class BearingsController < ApplicationController
  before_action :set_bearing, only: [:show, :edit, :update, :destroy]

  # GET /bearings
  # GET /bearings.json
  def index
    @bearings = Bearing.all
  end

  # GET /bearings/1
  # GET /bearings/1.json
  def show
  end

  # GET /bearings/new
  def new
    @bearing = Bearing.new
  end

  # GET /bearings/1/edit
  def edit
  end

  # POST /bearings
  # POST /bearings.json
  def create
    @bearing = Bearing.new(bearing_params)
    @bearing.codeno = 'BRG' + @bearing.materialdescription + @bearing.typec


    respond_to do |format|
      if @bearing.save
        format.html { redirect_to @bearing, notice: 'Bearing was successfully created.' }
        format.json { render :show, status: :created, location: @bearing }
      else
        format.html { render :new }
        format.json { render json: @bearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bearings/1
  # PATCH/PUT /bearings/1.json
  def update
    respond_to do |format|
      if @bearing.update(bearing_params)
        format.html { redirect_to @bearing, notice: 'Bearing was successfully updated.' }
        format.json { render :show, status: :ok, location: @bearing }
      else
        format.html { render :edit }
        format.json { render json: @bearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bearings/1
  # DELETE /bearings/1.json
  def destroy
    @bearing.destroy
    respond_to do |format|
      format.html { redirect_to bearings_url, notice: 'Bearing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bearing
      @bearing = Bearing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bearing_params
      params.require(:bearing).permit(:slno, :codeno, :typec, :materialdescription, :size, :quantity)
    end
end
