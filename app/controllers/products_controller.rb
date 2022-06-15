class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product                      = Product.new
    @product.date_of_rejection    = params[:date_of_rejection]
    @product.production_date      = params[:production_date]
    @product.expiration_date_type = params[:expiration_date_type]
    @product.expiration_date      = params[:expiration_date]
  end

  def create
    @product = Product.create(product_params)
    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(update_product_params)
    redirect_to @product
  end

  def destroy
    Product.destroy_by(id: params[:id])
    redirect_to products_path
  end

  def add_photo_form
    @product = Product.find(params[:id])
  end

  def add_photo
    @product = Product.find(params[:id])
    @product.photos.attach(params[:photo])
    redirect_to @product
  end

  private
    def product_params
      params.require(:product).permit(
        :plu, :quantity, :type_of_quantity, :date_of_rejection, :photos, 
        :production_date, :description, :expiration_date_type, :expiration_date
      )
    end

    def update_product_params 
      params.require(:product).permit(:plu, :quantity, :type_of_quantity)
    end
end
