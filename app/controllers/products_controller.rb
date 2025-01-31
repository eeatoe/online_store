class ProductsController < ApplicationController
  def index
    @products = Spree::Product.all
  end
end