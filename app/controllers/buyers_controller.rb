class BuyersController < ApplicationController
  before_action :authenticate_user!  , only: [:index,:create]
 

  def index
    @item = Item.find(params[:item_id])
    @credit_address=CreditAddress.new
      if current_user == @item.user
      redirect_to root_path
      end
  end
 
  def create
    @item = Item.find(params[:item_id])
    @credit_address=CreditAddress.new(buyer_params)
 if @credit_address.valid?
    @credit_address.save
    redirect_to root_path
  else
    render :index
 end
  end

  private


  def buyer_params
    params.require(:credit_address).permit(:post_code, :area_id, :city, :house_number, :house_name,:phone_number,:user_id,:item_id).merge(user_id: current_user.id)
  end


end