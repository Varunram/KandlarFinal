class RodsController < ApplicationController
  before_action :set_rod, only: [:show, :edit, :update, :destroy]

  # GET /rods
  # GET /rods.json
  def index
    @rods = Rod.all
  end

  # GET /rods/1
  # GET /rods/1.json
  def show
  end

  # GET /rods/new
  def new
    @rod = Rod.new
  end

  # GET /rods/1/edit
  def edit
  end

  # POST /rods
  # POST /rods.json
  def create
    @rod = Rod.new(rod_params)
    @rod.slno = @rod.id
    @rod.code = 'ROD' + @rod.material + @rod.typec

    respond_to do |format|
      if @rod.save
        format.html { redirect_to @rod, notice: 'Rod was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rod }
      else
        format.html { render action: 'new' }
        format.json { render json: @rod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rods/1
  # PATCH/PUT /rods/1.json
  def update
    respond_to do |format|
      if @rod.update(rod_params)
        format.html { redirect_to @rod, notice: 'Rod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rods/1
  # DELETE /rods/1.json
  def destroy
    @rod.destroy
    respond_to do |format|
      format.html { redirect_to rods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rod
      @rod = Rod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rod_params
      params.require(:rod).permit(:slno, :code, :typec, :material, :size, :tk, :dia, :lg, :quantity, :weight, :price)
    end
end
