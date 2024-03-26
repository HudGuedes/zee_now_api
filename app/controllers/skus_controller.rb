class SkusController < ApplicationController
	before_action :authenticate_user!
	before_action :set_product
	before_action :set_sku, only: [:show, :update, :destroy]

	def index
		@skus = @product.skus
		render json: @skus
	end

	def show
		render json: @sku
	end

	def edit
		render json: @sku
	end

	def create
	end

	def update
		if @sku.update(sku_params)
			render json: @sku
		else
			render json: @sku.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@sku.destroy
	end

	private

	def set_product
		@product = Product.find(params[:product_id])
	end

	def set_sku
		@sku = @product.skus.find(params[:id])
	end

	def sku_params
		params.require(:sku).permit(:code, :name, :stock, :price_table, :price_listing)
	end
end
