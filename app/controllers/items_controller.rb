class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
    items = Item.all
    end
    render json: items, include: :user
  end
  def show
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.find(params[:id])
    else
      item = Item.find(params[:id])
    end
    render json: item, include: :user
  end
  def create
      user = User.find(params[:user_id])
      item = user.items.create(item_params)
      render json: item, status: :created
  end
  private
  def item_params
    params.permit(:name, :description, :price)
  end


end
