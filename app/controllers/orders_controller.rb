class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @card_address = CardAddress.new
  end

  def create
    @card_address = CardAddress.new(order_params)
     if @card_address.valid?
       pay_item
       @card_address.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private
  def order_params
    params.require(:card_address).permit(:postal, :prefecture_id, :city, :address, :building_name, :phone ).merge( token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.user_item
      redirect_to root_path
    end
  end

end
