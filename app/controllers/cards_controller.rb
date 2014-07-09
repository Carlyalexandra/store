class CardsController < ApplicationController

  def new
  	@card = Card.new
  	@user = User.find(session[:user_id])
  end

	def create
	  	@card = Card.new(card_params)
	  	@card.user = User.find(session[:user_id])
	  	if @card.save
	  	  flash[:notice] = "New card created."
	  	  redirect_to user_path(params[:user_id])
	  	else
	  		flash[:alert] = "There was a problem, please try again."
	  		redirect_to new_user_card_path(user_id: params[:user_id])
	  	end
	  end


  def show
    @card = Card.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def edit
    @card = Card.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
     @card = Card.find(params[:id])
    if @card.update(card_params)
      flash[:notice] = "Card updated."
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "There was a problem, please try again."
      redirect_to user_card_path(user_id: params[:user_id])
    end
  end

  def destroy
  end

  private
   def card_params
  	params.require(:card).permit(:full_name, :card_number, :security_code, :zipcode, :exp_month, :exp_year, :nickname)
  end

  def set_user
  	@user = User.find(params[:id])
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
