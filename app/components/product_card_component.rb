# frozen_string_literal: true

class ProductCardComponent < ViewComponent::Base
  def initialize(name:, description:)
    @name = name
    @description = description
  end
end
