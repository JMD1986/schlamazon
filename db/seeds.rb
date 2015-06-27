50.times do
  user = User.new
  user.name = Faker::Name.first_name
  user.email = Faker::Internet.free_email("#{user.name}")
  user.password = user.name
  user.password_confirmation = user.name
  user.save

  product = Product.create( category: Faker::Commerce.department,
                            title: Faker::Commerce.product_name,
                            price: Faker::Commerce.price,
                            description: Faker::Lorem.sentence,
                            inventory: Faker::Number.digit,
                            imageurl: "http://i.imgur.com/96kGJAZ.png")

  order = Order.create(user_id: user.id, completed: [true, false].sample)

  ProductOrder.create(order_id: order.id, user_id: user.id, quantity: Array(1..5).sample)


end

