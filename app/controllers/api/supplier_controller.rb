class Api::SupplierController < ApplicationController
  respond_to :json

  def index
    @bean = CoffeeBean.find params[:coffee_bean_id]
  end
end
