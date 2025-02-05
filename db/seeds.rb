# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Загрузка стандартных данных Spree
Spree::Core::Engine.load_seed
Spree::Auth::Engine.load_seed

# Создание категорий доставки
Spree::ShippingCategory.find_or_create_by!(name: "Стандартная доставка")
Spree::ShippingCategory.find_or_create_by!(name: "Экспресс-доставка")
Spree::ShippingCategory.find_or_create_by!(name: "Бесплатная доставка")

# Создаем Taxonomy (контейнер для категорий)
categories_taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Категории')

# Создаем корневой Taxon (корневая категория)
root_taxon = categories_taxonomy.root

# Создаем дочерние категории (Taxons). Это будут основные категории
outerwear = Spree::Taxon.find_or_create_by!(name: "Верхняя одежда", parent: root_taxon, taxonomy: categories_taxonomy)
pants = Spree::Taxon.find_or_create_by!(name: "Брюки", parent: root_taxon, taxonomy: categories_taxonomy)
tshirt = Spree::Taxon.find_or_create_by!(name: "Футболки", parent: root_taxon, taxonomy: categories_taxonomy)

# Создаем подкатегории для верхней одежды
jackets = Spree::Taxon.find_or_create_by!(name: "Куртки", parent: outerwear, taxonomy: categories_taxonomy)
Spree::Taxon.find_or_create_by!(name: "Короткие куртки", parent: jackets, taxonomy: categories_taxonomy)
Spree::Taxon.find_or_create_by!(name: "Длинные куртки", parent: jackets, taxonomy: categories_taxonomy)
Spree::Taxon.find_or_create_by!(name: "Ветровки", parent: outerwear, taxonomy: categories_taxonomy)

# Создаем подкатегории для футболок
Spree::Taxon.find_or_create_by!(name: "Поло", parent: tshirt, taxonomy: categories_taxonomy)
Spree::Taxon.find_or_create_by!(name: "Футболки с коротким рукавом", parent: tshirt, taxonomy: categories_taxonomy)

# Создаем подкатегории для брюк
Spree::Taxon.find_or_create_by!(name: "Джинсы", parent: pants, taxonomy: categories_taxonomy)
Spree::Taxon.find_or_create_by!(name: "Классические брюки", parent: pants, taxonomy: categories_taxonomy)


=begin
# Создаем продукты
product1 = Spree::Product.find_or_create_by!(
  name: "Levi's Men's Ss Original Housemark Tee T-Shirt, Core Chesthit Logo",
  description: "Some things are perfect just the way they are. The classic T-shirt is one of them. That's why we kept it simple with 100% cotton jersey, a timeless fit.",
  available_on: Time.now,
  shipping_category: Spree::ShippingCategory.find_by!(name: 'Стандартная доставка'),
  meta_keywords: "футболки, белые, одежда",
  slug: "tshirt-levis-mens-housemark-tee",
  price: 42.50, 
  currency: 'USD'

)
product1.taxons << tshirt


# product1.master.price.create!(amount: 1990, currency: "RUB")

# Добавляем изображения к продукту, если их ещё нет
if product1.images.empty?
  product1.images.create!(attachment: Rails.root.join("app/assets/images/products/levis-mens-501-fit-jeans/71L1WS5geKL._AC_SX342_.jpg"))
  product1.images.create!(attachment: Rails.root.join("app/assets/images/products/levis-mens-501-fit-jeans/81rlu+00crL._AC_SX342_.jpg"))
  product1.images.create!(attachment: Rails.root.join("app/assets/images/products/levis-mens-501-fit-jeans/81xFzMBRn-L._AC_SX342_.jpg"))
  product1.images.create!(attachment: Rails.root.join("app/assets/images/products/levis-mens-501-fit-jeans/A1n+2YwM7pL._AC_SX342_.jpg"))
end

product2 = Spree::Product.find_or_create_by!(
  name: "Levi's Men's 501 Original Fit Jeans",
  description: "Close your eyes. Think “jeans.” Now open. They were 501s, right? With a classic straight leg and iconic styling, they’re literally the blueprint for every pair of jeans in existence — burned into the world’s collective cortex ever since Levi Strauss (the man himself!) invented them in 1873. To this day they’ve never gone out of style. And they never will.",
  available_on: Time.now,
  shipping_category: Spree::ShippingCategory.find_by!(name: 'Стандартная доставка'),
  meta_keywords: "джинсы, узкие, одежда",
  slug: "jeans-levis-mens-501",
  taxons: [Spree::Taxon.find_by!(name: "Брюки"), Spree::Taxon.find_by!(name: "Джинсы")]
)
product2.master.price.create!(amount: 6990, currency: "RUB")
=end