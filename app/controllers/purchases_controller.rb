class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
    else
      render action: :new
    end
  end

    private
  def purchase_params
    params.require(:order).permit(:zip, :prefecture_id, :city, :house_num, :building, :phone_num).merge(user_id: current_user.id, item_id: @item.id) 
  end
end
