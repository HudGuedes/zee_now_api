class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, include: :skus
  end

  def show
    render json: @product, include: :skus
  end

  def edit
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, include: :skus, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:slug, :name, :description, :manufacturer, :active, skus_attributes: [:id, :code, :name, :stock, :price_list, :listing_price])
  end
end
    