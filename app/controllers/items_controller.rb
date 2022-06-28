class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_info_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
