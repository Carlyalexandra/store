class OrdersController < ApplicationController
before_action :set_user, only: [:new, :create, :show, :edit, :update]
before_action :set_order, only: [:show, :edit, :update]

  def index
  end

  def new
  	@order = Order.new	
  end

  def create 
     product = Product.find(params[:product_id]) 
     quantity = params[:quantity]

     if @user.orders.present? && @user.orders.last.shipped.blank?
        @order = @user.orders.last
     else
	  	  @order = Order.new
        @order.user = @user
        @order.save
     end
     item = OrdersProduct.new(order_id: @order.id, product_id: product.id, quantity: quantity)
     if item.save
	  	  flash[:notice] = "New order made."
	  	   redirect_to user_order_path(@user, @order)
	  	else
	  		flash[:alert] = "There was a problem, please try again."
	  		redirect_to new_user_order_path(user_id: params[:user_id])
	  	end
	  end

  def remove
    @op = OrdersProduct.find(params[:id])
    @op.delete
    redirect_to user_order_path(session[:user_id], params[:order_id]), notice: 'Item removed'
  end

  def show
  end

  def edit
  end

   def update 
   @op = OrdersProduct.find(params[:orders_products])
     if @op.update(quantity: params[:quantity])
        flash[:notice] = "Order updated."
         redirect_to user_order_path(@user, @order)
      else
        flash[:alert] = "There was a problem, please try again."
        redirect_to user_order_path(@user, @order)
      end
   end

private
   def order_params
  	params.require(:order).permit(:shipped)
  end

  def set_user
  	 @user = User.find(session[:user_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
