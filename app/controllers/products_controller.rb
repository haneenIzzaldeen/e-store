class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :destroy,:edit,:update]
    before_action :admin_only, only: [ :show,:index, :destroy,:edit,:update]
	def new 
		@product = Product.new    
	end
	def create 
		@product = Product.new(product_params)
		if @product.save 
           redirect_to products_path
		end
	end
	def index 
		@products = Product.all
	end 
	def show 
	end
    def update
        @product.update(product_params)
        redirect_to products_path
    end
	def edit
        
    end
    def destroy
        @product.destroy
		redirect_to products_path
    end
	def allproducts
        @product = Product.where(params[:user_id])
	end
	private 
	def product_params
		params.require(:product).permit(:name, :description,:price ,:production_date ,:expiration_date,:stock_quantity)
	end
    def set_product
        @product = Product.find(params[:id])
	end
end
