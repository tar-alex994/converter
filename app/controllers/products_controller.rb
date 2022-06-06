class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @date_of_rejection = params[:date_of_rejection]
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
