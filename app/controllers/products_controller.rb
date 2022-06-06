class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @date_of_rejection = params[:date_of_rejection]
  end

  def create
    @product = Product.create(product_params)
    redirect_to @product
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:plu, :quantity, :type_of_quantity, :date_of_rejection)
    end
end
