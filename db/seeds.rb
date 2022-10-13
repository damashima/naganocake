# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

#Customer.create!(
   #last_name: "山田",
   #first_name: "花子",
   #last_name_kana: "ヤマダ",
   #first_name_kana: "ハナコ",
   #postal_code: "4008501",
   #address: "山梨県甲府市丸の内1-6-1",
   #telephone_number: "0552371111",
   #email: "test@test.com",
   #password: "customer",
   #password_confirmation: "customer",
   #is_deleted: false
#)

Item.create!(
   name: "ショートケーキ",
   introduction: "いちごのケーキ",
   price: "300",
   image: open("./app/assets/images/sweets_shortcake.png")
   )

Item.create!(
   name: "チョコケーキ",
   introduction: "ベルギー産のチョコレートを使用したケーキ",
   price: "400",
   image: open("./app/assets/images/sweets_chocolate_cake_sachertorte.png")
   )

Item.create!(
   name: "チーズケーキ",
   introduction: "4種のチーズを使用した濃厚なケーキ",
   price: "400",
   image: open("./app/assets/images/sweets_cheesecake.png")
   )