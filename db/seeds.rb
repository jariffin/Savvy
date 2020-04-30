# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

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

zara = Brand.create!(name: "Zara", email: "contact@zara.com", website: "www.zara.com")
hm = Brand.create!(name: "H&M", email: "contact@h&m.com", website: "www.hm.com")
massimodutti = Brand.create!(name: "Massimo Dutti", email: "contact@massimodutti.com", website: "www.massimodutti.com")
uniqlo = Brand.create!(name: "Uniqlo", email: "contact@uniqlo.com", website: "www.uniqlo.com")
mango = Brand.create!(name: "Mango", email: "contact@mango.com", website: "www.shop.mango.com")

puts "Creating Garments..."

def create_blend(material, garment, percentage_material)
  Blend.create!(material_id: material.id, garment_id: garment.id, percentage_material: percentage_material)
end

file_1 = URI.open("https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80")
dress = Garment.create!(name: "Dress", brand_id: mango.id)
dress.image.attach(io: file_1, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, dress, 64)
create_blend(modal, dress, 29)
create_blend(polyamide, dress, 6)
create_blend(elastane, dress, 1)

file_2 = URI.open("https://images.pexels.com/photos/792762/pexels-photo-792762.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
pants = Garment.create!(name: "Pants", brand_id: massimodutti.id,)
pants.image.attach(io: file_2, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(viscose, pants, 94)
create_blend(elastane, pants, 6)

file_3 = URI.open("https://images.unsplash.com/photo-1584382296087-ac00c7263710?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80")
jeans = Garment.create!(name: "Jeans", brand_id: hm.id)
jeans.image.attach(io: file_3, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, jeans, 80)
create_blend(polyester, jeans, 20)

file_4 = URI.open("https://images.unsplash.com/photo-1564584217132-2271feaeb3c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
shirt = Garment.create!(name: "Shirt", brand_id: zara.id)
shirt.image.attach(io: file_4, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, shirt, 100)

file_5 = URI.open("https://images.pexels.com/photos/2146344/pexels-photo-2146344.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
linen_coat = Garment.create!(name: "Linen Coat", brand_id: uniqlo.id)
linen_coat.image.attach(io: file_5, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, linen_coat, 50)
create_blend(linen, linen_coat, 50)

file_6 = URI.open("https://images.pexels.com/photos/1082526/pexels-photo-1082526.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
jeans2 = Garment.create!(name: "Jeans", brand_id: massimodutti.id)
jeans2.image.attach(io: file_6, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, jeans2, 85)
create_blend(polyester, jeans2, 15)

file_7 = URI.open("https://images.unsplash.com/photo-1571729024267-e0120826dfe6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80")
sweater = Garment.create!(name: "Sweater", brand_id: hm.id)
sweater.image.attach(io: file_7, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(wool, sweater, 100)

file_8 = URI.open("https://images.unsplash.com/photo-1568354930999-0ed46fc4ab5a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
socks = Garment.create!(name: "Socks", brand_id: zara.id)
socks.image.attach(io: file_8, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, socks, 50)
create_blend(polyester, socks, 25)
create_blend(polyamide, socks, 25)
socks.save!

file_9 = URI.open("https://images.unsplash.com/photo-1581798117964-aa8a5238c350?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1019&q=80")
dress2 = Garment.create!(name: "Dress", brand_id: mango.id)
dress2.image.attach(io: file_9, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, dress2, 50)
create_blend(modal, dress2, 29)
create_blend(polyamide, dress2, 21)



puts "Creating Purchases..."

Purchase.create!(garment_id: jeans.id, user_id: sandy.id)
Purchase.create!(garment_id: dress.id, user_id: sandy.id)
Purchase.create!(garment_id: pants.id, user_id: sandy.id)
Purchase.create!(garment_id: shirt.id, user_id: sandy.id)
Purchase.create!(garment_id: linen_coat.id, user_id: sandy.id)
Purchase.create!(garment_id: jeans2.id, user_id: sandy.id)
Purchase.create!(garment_id: dress2.id, user_id: sandy.id)
Purchase.create!(garment_id: sweater.id, user_id: sandy.id)
Purchase.create!(garment_id: socks.id, user_id: sandy.id)

puts "Done!"















