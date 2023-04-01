class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  before_action :correct_profile, only: [:edit, :update, :destroy]
  before_action :authenticate_profile!

  def index
    @api = StockQuote::Stock.new(api_key: 'pk_16a849fd637243a79fff90fa4d42bc5d')
    @stocks = Stock.all
  end


  def show
  end


  def new
    @stock = Stock.new
  end


  def edit
  end


  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was deleted.' }
      format.json { head :no_content }
    end
  end

  def correct_profile
    @ticker = current_profile.stocks.find_by(id: params[:id])
    redirect_to stocks_path, notice: "Cannot edit this stock" if @ticker.nil?
  end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end


    def stock_params
      params.require(:stock).permit(:ticker, :profile_id)
    end
end
