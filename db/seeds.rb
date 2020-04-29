# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."

puts "Destroying purchases..."
Purchase.destroy_all

puts "Destroying blends"
Blend.destroy_all

puts "Destroying materials"
Material.destroy_all

puts "Destroying garments..."
Garment.destroy_all

puts "Destroying brands..."
Brand.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Database clean!"

puts "Creating Users..."

sandy = User.create!(email:"sandy@gmail.com",
                     password: "123456")

puts "Creating Group 1 (A+/A) Materials..."

hemp = Material.create!(name: "Hemp", synthetic: false, material_rating: 10)
linen = Material.create!(name: "Linen", synthetic: false, material_rating: 10)
flax = Material.create!(name: "Flax", synthetic: false, material_rating: 10)
lyocell = Material.create!(name: "Lyocell", synthetic: false, material_rating: 10)
tencel = Material.create!(name: "Tencel", synthetic: false, material_rating: 10)
jute = Material.create!(name: "Jute", synthetic: false, material_rating: 10)
pinatex = Material.create!(name: "Pinatex", synthetic: false, material_rating: 10)
nettle = Material.create!(name: "Nettle", synthetic: false, material_rating: 10)
cotton_organic = Material.create!(name: "Cotton (Organic)", synthetic: false, material_rating: 10)
soy = Material.create!(name: "Soy", synthetic: false, material_rating: 10)
soy_silk = Material.create!(name: "Soy Silk", synthetic: false, material_rating: 10)

puts "Creating Group 2 (B+/B) Materials..."

rayon = Material.create!(name: "Rayon", synthetic: false, material_rating: 7)
viscose = Material.create!(name: "Viscose", synthetic: false, material_rating: 7)
bamboo = Material.create!(name: "Bamboo", synthetic: false, material_rating: 7)
cotton = Material.create!(name: "Cotton", synthetic: false, material_rating: 7)
modal = Material.create!(name: "Modal", synthetic: false, material_rating: 7)
wool = Material.create!(name: "Wool", synthetic: false, material_rating: 7)
cashmere = Material.create!(name: "Cashmere", synthetic: false, material_rating: 7)
silk = Material.create!(name: "Silk", synthetic: false, material_rating: 7)
ramie = Material.create!(name: "Ramie", synthetic: false, material_rating: 7)
down = Material.create!(name: "Down", synthetic: false, material_rating: 7)

puts "Creating Group 2 (C+/C) Materials..."

leather = Material.create!(name: "Leather", synthetic: false, material_rating: 3)
fur = Material.create!(name: "Fur", synthetic: false, material_rating: 3)
polyester = Material.create!(name: "Polyester", synthetic: true, material_rating: 3)
acrylic = Material.create!(name: "Acrylic", synthetic: true, material_rating: 3)
spandex = Material.create!(name: "Spandex", synthetic: true, material_rating: 3)
nylon = Material.create!(name: "Nylon", synthetic: true, material_rating: 3)
polyurethane = Material.create!(name: "Polyurethane", synthetic: true, material_rating: 3)
# synonym for nylon
polyamide = Material.create!(name: "Polyamide", synthetic: true, material_rating: 3)
# synonym for spandex
elastane = Material.create!(name: "Elastane", synthetic: true, material_rating: 3)


puts "Creating Brands..."

zara = Brand.create!(name: "zara", email: "contact@zara.com", website: "www.zara.com")
hm = Brand.create!(name: "H&M", email: "contact@h&m.com", website: "www.hm.com")
massimodutti = Brand.create!(name: "Massimo Dutti", email: "contact@massimodutti.com", website: "www.massimodutti.com")
uniqlo = Brand.create!(name: "Uniqlo", email: "contact@uniqlo.com", website: "www.uniqlo.com")
mango = Brand.create!(name: "Mango", email: "contact@mango.com", website: "www.shop.mango.com")

puts "Creating Garments..."

def create_blend(material, garment, percentage_material)
  Blend.create!(material_id: material.id, garment_id: garment.id, percentage_material: percentage_material)
end

jeans = Garment.create!(name: "Jeans", brand_id: hm.id)
create_blend(cotton, jeans, 80)
create_blend(polyester, jeans, 20)

shirt = Garment.create!(name: "Shirt", brand_id: zara.id )
create_blend(cotton, shirt, 100)

linen_coat = Garment.create!(name: "Linen Coat", brand_id: uniqlo.id )
create_blend(cotton, linen_coat, 50)
create_blend(linen, linen_coat, 50)

dress = Garment.create!(name: "Dress", brand_id: mango.id )
create_blend(cotton, dress, 64)
create_blend(modal, dress, 29)
create_blend(polyamide, dress, 6)
create_blend(elastane, dress, 1)

pants = Garment.create!(name: "Pants", brand_id: massimodutti.id )
create_blend(viscose, pants, 94)
create_blend(elastane, pants, 6)

puts "Creating Purchases..."

Purchase.create!(garment_id: jeans.id, user_id: sandy.id)
Purchase.create!(garment_id: dress.id, user_id: sandy.id)
Purchase.create!(garment_id: pants.id, user_id: sandy.id)
Purchase.create!(garment_id: shirt.id, user_id: sandy.id)
Purchase.create!(garment_id: linen_coat.id, user_id: sandy.id)
Purchase.create!(garment_id: jeans.id, user_id: sandy.id)
Purchase.create!(garment_id: dress.id, user_id: sandy.id)
Purchase.create!(garment_id: shirt.id, user_id: sandy.id)
Purchase.create!(garment_id: shirt.id, user_id: sandy.id)

puts "Done!"















