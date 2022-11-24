5.times do
	Product.create(
		title: Faker::Commerce.product_name,
		price: Faker::Commerce.price,
	)
end