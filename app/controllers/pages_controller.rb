class PagesController < ApplicationController
  def admin_home
  end
  def owner_home
  end
  def guest
    @product = Product.all
    @category = Category.all
  end
  def index
    @product = Product.order(:price)
    render :guest
  end
  def show
    @category = Category.find(params[:id])
    @product = Category.find(params[:id]).products
    render :index
  end

end
