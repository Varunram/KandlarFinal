class WeldingsController < ApplicationController
  before_action :set_welding, only: [:show, :edit, :update, :destroy]

  # GET /weldings
  # GET /weldings.json
  def index
    @weldings = Welding.all
  end

  # GET /weldings/1
  # GET /weldings/1.json
  def show
  end

  # GET /weldings/new
  def new
    @welding = Welding.new
  end

  # GET /weldings/1/edit
  def edit
  end

  # POST /weldings
  # POST /weldings.json
  def create
    @welding = Welding.new(welding_params)
    @welding.codeno = 'WDD' + @welding.description + @welding.UOM


    respond_to do |format|
      if @welding.save
        format.html { redirect_to @welding, notice: 'Welding was successfully created.' }
        format.json { render :show, status: :created, location: @welding }
      else
        format.html { render :new }
        format.json { render json: @welding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weldings/1
  # PATCH/PUT /weldings/1.json
  def update
    respond_to do |format|
      if @welding.update(welding_params)
        format.html { redirect_to @welding, notice: 'Welding was successfully updated.' }
        format.json { render :show, status: :ok, location: @welding }
      else
        format.html { render :edit }
        format.json { render json: @welding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weldings/1
  # DELETE /weldings/1.json
  def destroy
    @welding.destroy
    respond_to do |format|
      format.html { redirect_to weldings_url, notice: 'Welding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welding
      @welding = Welding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welding_params
      params.require(:welding).permit(:slno, :codeno, :description, :quantity, :UOM)
    end
end
