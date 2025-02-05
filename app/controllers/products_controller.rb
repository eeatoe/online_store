class ProductsController < ApplicationController
  before_action :set_active_storage_url_options

  def index
    @products = Spree::Product.all
  end

  private

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end

