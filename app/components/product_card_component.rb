# frozen_string_literal: true

class ProductCardComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end

  def image_url
    if @product.images.any
      @product.images.first.attachment.url
    else
      "placeholder.jpg"
    end
  end
end
