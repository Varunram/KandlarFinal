class FlangesController < ApplicationController
  before_action :set_flange, only: [:show, :edit, :update, :destroy]

  # GET /flanges
  # GET /flanges.json
  def index
    @flanges = Flange.all
  end

  # GET /flanges/1
  # GET /flanges/1.json
  def show
  end

  # GET /flanges/new
  def new
    @flange = Flange.new
  end

  # GET /flanges/1/edit
  def edit
  end

  # POST /flanges
  # POST /flanges.json
  def create
    @flange = Flange.new(flange_params)
    @flange.codeno = 'FLA' + @flange.materialgrade + @flange.classc


    respond_to do |format|
      if @flange.save
        format.html { redirect_to @flange, notice: 'Flange was successfully created.' }
        format.json { render :show, status: :created, location: @flange }
      else
        format.html { render :new }
        format.json { render json: @flange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flanges/1
  # PATCH/PUT /flanges/1.json
  def update
    respond_to do |format|
      if @flange.update(flange_params)
        format.html { redirect_to @flange, notice: 'Flange was successfully updated.' }
        format.json { render :show, status: :ok, location: @flange }
      else
        format.html { render :edit }
        format.json { render json: @flange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flanges/1
  # DELETE /flanges/1.json
  def destroy
    @flange.destroy
    respond_to do |format|
      format.html { redirect_to flanges_url, notice: 'Flange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flange
      @flange = Flange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flange_params
      params.require(:flange).permit(:slno, :codeno, :materialgrade, :size, :classc, :tk, :quantity, :kgs)
    end
end
