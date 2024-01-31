class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def show; end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created Successfully.'
    else
      render :new, alert: 'Could not create inventory.'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    if @inventory.destroyed?
      flash[:notice] = 'Successfully deleted inventory.'
      redirect_to inventories_path
    else
      flash[:alert] = 'Could not delete inventory.'
      redirect_back(fallback_location: inventories_path)
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description).merge(user: current_user)
  end
end
