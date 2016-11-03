class Api::CoffeeBeanController < ApplicationController
  respond_to :json

  def index
    @beans = CoffeeBean.order(order).limit(page_size).offset(skip_recs)
    @beans = @beans.where(country: country) if country.present?
  end

  def show
    @bean = CoffeeBean.find params[:id]
  end

  private

  def order
    params[:order] || :name
  end

  def country
    params[:country]
  end

  def page
    params[:page].to_i
  end

  def skip_recs
    page_size * page
  end
end
