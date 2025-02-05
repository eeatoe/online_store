module Spree
  module ImageDecorator
    module ClassMethods
      def styles
        {
          # change existing default sizes used in Admin Panel and API
          mini:    '48x48>',
          small:   '100x100>',
          product: '240x240>',
          large:   '600x600>', 
          # add your new size here, which will be automatically available in the API
          product_card: '1000x1000>'
        }
      end
    end

    def self.prepended(base)
      base.inheritance_column = nil
      base.singleton_class.prepend ClassMethods
    end
  end

  Image.prepend(ImageDecorator)
end
