class ProductsController < ApplicationController
  def index
     @productall = Product.all
    
  end

  def new
  	@product = Product.new
  end

 def create
  	@product = Product.create(product_params)

    redirect_to products_path
  end


  def show	
  	@product = Product.find(params[:id])
    @order = Order.new
  end



  def edit
      @product = Product.find(params[:id])
  end


  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "New user updated."
      redirect_to @product
    else
      flash[:alert] = "There was a problem, please try again."
      redirect_to products_path(@product)
    end

  end


  private
  def product_params
  	params.require(:product).permit(:name, :description, :price, :photo)
  end


end
