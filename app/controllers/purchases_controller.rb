class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
    else
      render action: :new
    end
  end

    private
  def purchase_params
    params.require(:order).permit(:zip, :prefecture_id, :city, :house_num, :building, :phone_num).merge(user_id: current_user.id, item_id: @item.id, price: @item.price, token: params[:token]) 
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: purchase_params[:price],
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
