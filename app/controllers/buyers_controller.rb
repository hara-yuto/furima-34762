class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new

  end

  def create
    @credit_address=CreditAddress.new(address_params)
    redirect_to root_path
  end

  private


  def address_params
    params.permit(:post_code, :area_id, :city, :house_number, :house_name,:phone_number).merge(user_id: current_user.id)
  end
end