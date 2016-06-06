class ProductsController < ApplicationController
  include SessionHelper
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

  end

  def add
    @product = Product.find(params[:id])
    selection = Selecteditem.new(product: @product, user: current_user)
    if selection.save
      flash[:notice] = selection.product.name + " was added to your cart"
      redirect_to root_url
    else
      # create errors here
    end
  end


end
