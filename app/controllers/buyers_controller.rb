class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params, only: [:index, :create]
  before_action :rooting, only: [:index, :create]

  def index
    @credit_address = CreditAddress.new  
  end

  def create  
    @credit_address = CreditAddress.new(buyer_params)
    if @credit_address.valid?
      pay_item
      @credit_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def rooting
    redirect_to root_path if current_user == @item.user || @item.buyer.present?
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:credit_address).permit(:post_code, :area_id, :city, :house_number, :house_name, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
