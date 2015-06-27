# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
 user = User.create(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456", password_confirmation: "123456")
 end
  3.times do
   order = user.orders.create(status: ["completed","processing"].sample)
 end
 5.times do
   product = Product.create(category: Faker::Commerce.department,
                             title: Faker::Commerce.product_name,
                              price: Faker::Commerce.price,
                              description: Faker::Lorem.sentence,
                              inventory: Faker::Number.digit,
                              imageurl: "http://i.imgur.com/96kGJAZ.png")
 end

Order.all.each do |order|
 4.times do
   random_product = Product.offset(rand(Product.count)).first
   ProductOrder.create(product_id: random_product.id,
                          order_id: order.id,
                          quantity: Faker::Number.digit)
 end
end
