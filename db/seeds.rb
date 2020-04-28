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

puts "Creating Materials..."


cotton = Material.create!(name: "cotton", synthetic: false)
silk = Material.create!(name: "silk", synthetic: false)
wool = Material.create!(name: "wool", synthetic: false)
cashmere = Material.create!(name: "cashmere", synthetic: false)
linen = Material.create!(name: "linen", synthetic: false)
hemp = Material.create!(name: "hemp", synthetic: false)

bamboo = Material.create!(name: "bamboo", synthetic: false)
flax = Material.create!(name: "flax", synthetic: false)
rayon = Material.create!(name: "rayon", synthetic: false)
lyocell = Material.create!(name: "lyocell", synthetic: false)
modal = Material.create!(name: "modal", synthetic: false)
viscose = Material.create!(name: "viscose", synthetic: false)


polyester = Material.create!(name: "polyester", synthetic: true)
acrylic = Material.create!(name: "acrylic", synthetic: true)
spandex = Material.create!(name: "spandex", synthetic: true)
nylon = Material.create!(name: "nylon", synthetic: true)
polyurethane = Material.create!(name: "polyurethane", synthetic: true)

# synonym for nylon
polyamide = Material.create!(name: "polyamide", synthetic: true)
# synonym for spandex
elastane = Material.create!(name: "elastane", synthetic: true)


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

jeans = Garment.create!(name: "jeans", brand_id: hm.id)
create_blend(cotton, jeans, 80)
create_blend(polyester, jeans, 20)

shirt = Garment.create!(name: "shirt", brand_id: zara.id )
create_blend(cotton, shirt, 100)

linen_coat = Garment.create!(name: "linen_coat", brand_id: uniqlo.id )
create_blend(cotton, linen_coat, 50)
create_blend(linen, linen_coat, 50)

dress = Garment.create!(name: "dress", brand_id: mango.id )
create_blend(cotton, dress, 64)
create_blend(modal, dress, 29)
create_blend(polyamide, dress, 6)
create_blend(elastane, dress, 1)

pants = Garment.create!(name: "pants", brand_id: massimodutti.id )
create_blend(viscose, pants, 94)
create_blend(elastane, pants, 6)

puts "Creating Purchases..."

Purchase.create!(garment_id: jeans.id, user_id: sandy.id)
Purchase.create!(garment_id: dress.id, user_id: sandy.id)
Purchase.create!(garment_id: pants.id, user_id: sandy.id)

puts "Done!"















