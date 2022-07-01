class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_info_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
    #end
  #end
end

