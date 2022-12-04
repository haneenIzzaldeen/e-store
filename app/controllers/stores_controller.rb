class StoresController < ApplicationController
    before_action :set_store, only: [:show, :destroy,:edit,:update]
    before_action :admin_only, only: [ :show,:index, :destroy,:edit,:update]
	def new 
		@store = Store.new    
	end
	def create 
		@store = Store.new(store_params)
		if @store.save 
           redirect_to stores_path
		end
	end
	def index 
		@stores = Store.all
	end 
	def show 
	end
    def update
        @store.update(store_params)
        redirect_to stores_path
    end
	def edit
        
    end
    def destroy
        @store.destroy
		redirect_to stores_path
    end
	private 
	def store_params
		params.require(:store).permit(:name , :user_id)
	end
    def set_store
        @store = Store.find(params[:id])
	end
end
