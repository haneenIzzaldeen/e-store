class ProductCategoriesController < ApplicationController
    before_action :admin_only, only: [ :show,:index, :destroy,:edit,:update]
    def new 
		@product_category = ProductCategory.new    
	end
    def index 
         @product_category =  ProductCategory.all
         
    end
    
    def create 
        @product_category = ProductCategory.new(product_params)
		if @product_category.save 
           redirect_to product_categories_path
		end
    end
    private 
	def product_params
		params.require(:product_category).permit(:category_id, :product_id)
    end
end