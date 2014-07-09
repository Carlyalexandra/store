class OrdersController < ApplicationController
  def index
  end

  def new
  	@order = Order.new
  	@user = User.find(session[:user_id])
  end

  def create
	   @user = User.find(session[:user_id])
     product = Product.find(params[:name]) #set this
     quantity = #set this
     if @user.orders.last.shipped == false	
        @order = @user.orders.last
     else
	  	  @order = Order.new
        @order.user = @user
        @order.save
     end
     item = OrdersProduct.create(order_id: @order.id, product_id: product.id, quantity: quantity)
     if item
	  	  flash[:notice] = "New order made."
	  	   redirect_to user_order_path(params[:order_id])
	  	else
	  		flash[:alert] = "There was a problem, please try again."
	  		redirect_to new_user_order_path(user_id: params[:user_id])
	  	end
	  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

private
   def order_params
  	params.require(:order).permit(:shipped)
  end

  def set_user
  	@user = User.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
