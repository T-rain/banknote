class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /costs
  # GET /costs.json
  def index
    @costs = current_user.costs.all
    @data = current_user.costs.dashboard()

  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = current_user.costs.new
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = current_user.costs.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to costs_url, notice: 'Cost was successfully created.' }
        format.json { render :index, status: :created, location: costs_url }
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
         format.html { redirect_to costs_url, notice: 'Cost was successfully created.' }
        format.json { render :index, status: :created, location: costs_url }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url, notice: 'Cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = current_user.costs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:title, :money)
    end
end
