class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :fee_id, :region_id, :delivery_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in? && @item.user.id == current_user.id && Purchase.where(item_id: @item.id).empty?

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
