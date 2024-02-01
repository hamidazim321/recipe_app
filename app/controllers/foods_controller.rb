class FoodsController < ApplicationController
  def create; end

  def destroy
    @food = Food.find_by_id(params[:id])
    if @food.destroy
      flash[:notice] = 'food removed'
    else
      flash[:error] = @food.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end
end
