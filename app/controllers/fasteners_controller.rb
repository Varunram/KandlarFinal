class FastenersController < ApplicationController
  before_action :set_fastener, only: [:show, :edit, :update, :destroy]

  # GET /fasteners
  # GET /fasteners.json
  def index
    @fasteners = Fastener.all
  end

  # GET /fasteners/1
  # GET /fasteners/1.json
  def show
  end

  # GET /fasteners/new
  def new
    @fastener = Fastener.new
  end

  # GET /fasteners/1/edit
  def edit
  end

  # POST /fasteners
  # POST /fasteners.json
  def create
    @fastener = Fastener.new(fastener_params)
    @fastener.codeno = 'FST' + @fastener.grade + @fastener.typec


    respond_to do |format|
      if @fastener.save
        format.html { redirect_to @fastener, notice: 'Fastener was successfully created.' }
        format.json { render :show, status: :created, location: @fastener }
      else
        format.html { render :new }
        format.json { render json: @fastener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fasteners/1
  # PATCH/PUT /fasteners/1.json
  def update
    respond_to do |format|
      if @fastener.update(fastener_params)
        format.html { redirect_to @fastener, notice: 'Fastener was successfully updated.' }
        format.json { render :show, status: :ok, location: @fastener }
      else
        format.html { render :edit }
        format.json { render json: @fastener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fasteners/1
  # DELETE /fasteners/1.json
  def destroy
    @fastener.destroy
    respond_to do |format|
      format.html { redirect_to fasteners_url, notice: 'Fastener was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fastener
      @fastener = Fastener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fastener_params
      params.require(:fastener).permit(:slno, :codeno, :typec, :grade, :item, :size, :quantity)
    end
end
