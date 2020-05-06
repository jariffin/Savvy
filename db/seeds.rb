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
alpaca = Material.create!(name: "Alpaca", synthetic: false, material_rating: 7)
mohair = Material.create!(name: "Mohair", synthetic: false, material_rating: 7)
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
acne_studios = Brand.create!(name: "ACNE Studios", email: "customercare@acnestudios.com", website: "www.acnestudios.com")
hugo_boss = Brand.create!(name: "Hugo Boss", email: "press(at)hugoboss.com", website: "www.hugoboss.com")
bershka = Brand.create!(name: "Bershka", email: "contact@bershka.com", website: "www.bershka.com")
calvin_klein = Brand.create!(name: "Calvin Klein", email: "service.uk@calvinklein.com", website: "www.calvinklein.co.uk")
coach = Brand.create!(name: "Coach", email: "contact@coach.com", website: "www.uk.coach.com")
dkny = Brand.create!(name: "DKNY", email: "HELP@DONNAKARAN.COM", website: "www.donnakaran.com")
dsquared2 = Brand.create!(name: "DSQUARED2", email: "contact@dsquared2.com", website: "www.dsquared2.com")
maje = Brand.create!(name: "Maje", email: "contact@maje.com", website: "www.maje.com")
liu_jo = Brand.create!(name: "Liu Jo", email: "contact@liujo.com", website: "www.liujo.com")
elisabetta_franchi = Brand.create!(name: "Elisabetta Franchi", email: "customercare@elisabettafranchi.com", website: "www.elisabettafranchi.com")
armani = Brand.create!(name: "Armani", email: "contact@armani.com", website: "www.armani.com")
etro = Brand.create!(name: "Etro", email: "customercareus@etro.com", website: "www.etro.com")
abercrombie_and_fitch = Brand.create!(name: "Abercrombie & Fitch", email: "Abercrombie@abercrombie.com", website: "www.abercrombie.com")
fred_perry = Brand.create!(name: "Fred Perry", email: "contact@fredperry.com", website: "www.fredperry.com")
french_connection = Brand.create!(name: "French Connection", email: "enquiries@frenchconnection.com", website: "www.frenchconnection.com")
ganni = Brand.create!(name: "Ganni", email: "contact@ganni.com", website: "www.ganni.com")
giambattista_valli = Brand.create!(name: "Giambattista Valli", email: "info@giambattistavalli.com", website: "www.giambattistavalli.com")
phillip_lim = Brand.create!(name: "Phillip Lim", email: "clientservices@31philliplim.com", website: "www.31philliplim.com")
seven_for_all_mankind = Brand.create!(name: "7 for all mankind", email: "7fam-uk@salesupply.net", website: "www.7forallmankind.eu")
alice_and_olivia = Brand.create!(name: "Alice + Olivia", email: "customercare@aliceandolivia.com", website: "www.aliceandolivia.com")
diane_von_furstenberg = Brand.create!(name: "Diane von Furstenberg", email: "clientservices@dvf.com", website: "www.dvf.com")
msgm = Brand.create!(name: "MSGM", email: "cs.msgm@the-ffw.com", website: "www.msgm.it")
muubaa = Brand.create!(name: "Muubaa", email: "customerservices@muubaa.com", website: "www.muubaa.com")
numeroventuno = Brand.create!(name: "N°21", email: "CUSTOMERCAREONLINE@NUMEROVENTUNO.COM", website: "www.numeroventuno.com")
nanushka = Brand.create!(name: "Nanushka", email: "customercare@nanushka.com", website: "www.nanushka.com")
off_white = Brand.create!(name: "OFF White", email: "ecommerce@off---white.com", website: "www.off---white.com")
paul_and_joe = Brand.create!(name: "Paul & Joe", email: "eshop@paulandjoe.net", website: "www.paulandjoe.com")
red_valentino = Brand.create!(name: "RED Valentino", email: "privacy@valentino.com", website: "www.redvalentino.com")
rag_bone = Brand.create!(name: "Rag & Bone", email: "help@rag-bone.com", website: "www.rag-bone.com")
roksanda = Brand.create!(name: "Roksanda", email: "enquiries@roksanda.com.", website: "www.roksanda.com")
walter_baker = Brand.create!(name: "Walter Baker", email: "info@walterbaker.com.", website: "www.walterbaker.com")
zimmermann = Brand.create!(name: "Zimmermann", email: "customerservice.eu@zimmermann.com", website: "www.zimmermannwear.com")

puts "Creating Garments..."

def create_blend(material, garment, percentage_material)
  garment.blends << Blend.new(material: material, percentage_material: percentage_material)
end

file_1 = URI.open("https://images.unsplash.com/flagged/photo-1585052201332-b8c0ce30972f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80")
dress = Garment.new(name: "Dress", brand_id: mango.id)
dress.image.attach(io: file_1, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, dress, 64)
create_blend(modal, dress, 29)
create_blend(polyamide, dress, 6)
create_blend(elastane, dress, 1)
dress.save!


file_2 = URI.open("https://images.pexels.com/photos/792762/pexels-photo-792762.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
pants = Garment.new(name: "Pants", brand_id: massimodutti.id,)
pants.image.attach(io: file_2, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(viscose, pants, 94)
create_blend(elastane, pants, 6)
pants.save!

file_3 = URI.open("https://images.unsplash.com/photo-1584382296087-ac00c7263710?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80")
jeans = Garment.new(name: "Jeans", brand_id: hm.id)
jeans.image.attach(io: file_3, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, jeans, 80)
create_blend(polyester, jeans, 20)
jeans.save!

file_4 = URI.open("https://images.unsplash.com/photo-1564584217132-2271feaeb3c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
shirt = Garment.new(name: "Shirt", brand_id: zara.id)
shirt.image.attach(io: file_4, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, shirt, 100)
shirt.save!

file_5 = URI.open("https://images.pexels.com/photos/2146344/pexels-photo-2146344.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
linen_coat = Garment.new(name: "Linen Coat", brand_id: uniqlo.id)
linen_coat.image.attach(io: file_5, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, linen_coat, 50)
create_blend(linen, linen_coat, 50)
linen_coat.save!

file_6 = URI.open("https://images.pexels.com/photos/1082526/pexels-photo-1082526.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
jeans2 = Garment.new(name: "Jeans", brand_id: massimodutti.id)
jeans2.image.attach(io: file_6, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, jeans2, 85)
create_blend(polyester, jeans2, 15)
jeans2.save!

file_7 = URI.open("https://images.unsplash.com/photo-1571729024267-e0120826dfe6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80")
sweater = Garment.new(name: "Sweater", brand_id: hm.id)
sweater.image.attach(io: file_7, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(wool, sweater, 100)
sweater.save!

file_8 = URI.open("https://images.unsplash.com/photo-1568354930999-0ed46fc4ab5a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
socks = Garment.new(name: "Socks", brand_id: zara.id)
socks.image.attach(io: file_8, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, socks, 50)
create_blend(polyester, socks, 25)
create_blend(polyamide, socks, 25)
socks.save!

file_9 = URI.open("https://images.unsplash.com/photo-1581798117964-aa8a5238c350?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1019&q=80")
dress2 = Garment.new(name: "Dress", brand_id: mango.id)
dress2.image.attach(io: file_9, filename: "image.jpeg", content_type: "image/jpeg")
create_blend(cotton, dress2, 50)
create_blend(modal, dress2, 29)
create_blend(polyamide, dress2, 21)
dress2.save!


puts "Creating Purchases..."

Purchase.create!(garment_id: jeans2.id, user_id: sandy.id)
Purchase.create!(garment_id: dress2.id, user_id: sandy.id)
Purchase.create!(garment_id: sweater.id, user_id: sandy.id)
Purchase.create!(garment_id: socks.id, user_id: sandy.id)
Purchase.create!(garment_id: pants.id, user_id: sandy.id)
Purchase.create!(garment_id: shirt.id, user_id: sandy.id)
Purchase.create!(garment_id: linen_coat.id, user_id: sandy.id)
Purchase.create!(garment_id: dress.id, user_id: sandy.id)
Purchase.create!(garment_id: jeans.id, user_id: sandy.id)

puts "Done!"















