class GasketsController < ApplicationController
  before_action :set_gasket, only: [:show, :edit, :update, :destroy]

  # GET /gaskets
  # GET /gaskets.json
  def index
    @gaskets = Gasket.all
  end

  # GET /gaskets/1
  # GET /gaskets/1.json
  def show
  end

  # GET /gaskets/new
  def new
    @gasket = Gasket.new
  end

  # GET /gaskets/1/edit
  def edit
  end

  # POST /gaskets
  # POST /gaskets.json
  def create
    @gasket = Gasket.new(gasket_params)
    @gasket.code = 'GKT' + @gasket.classc + @gasket.typec


    respond_to do |format|
      if @gasket.save
        format.html { redirect_to @gasket, notice: 'Gasket was successfully created.' }
        format.json { render :show, status: :created, location: @gasket }
      else
        format.html { render :new }
        format.json { render json: @gasket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaskets/1
  # PATCH/PUT /gaskets/1.json
  def update
    respond_to do |format|
      if @gasket.update(gasket_params)
        format.html { redirect_to @gasket, notice: 'Gasket was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasket }
      else
        format.html { render :edit }
        format.json { render json: @gasket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaskets/1
  # DELETE /gaskets/1.json
  def destroy
    @gasket.destroy
    respond_to do |format|
      format.html { redirect_to gaskets_url, notice: 'Gasket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasket
      @gasket = Gasket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasket_params
      params.require(:gasket).permit(:slno, :codeno, :typec, :material, :nb, :thk, :classc, :quantity)
    end
end
