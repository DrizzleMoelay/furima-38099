class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to item_orders_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, :street_no, :phone_no, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], purchase_record_id: params[:purchase_record_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
