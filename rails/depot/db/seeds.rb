# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(title: 'Cyclocross',
  description:
    %{<p>
      This is a great bike, fast on the road and in the woods.
      </p>},
  image_url: 'cyclo.jpg',
  price: 1090.50
)

Product.create!(title: 'Scott bike',
  description:
    %{<p>
      This is a great bike, fast on the road and in the woods.
      </p>},
  image_url: 'scott.jpg',
  price: 990.00
)

Product.create!(title: 'Canondale bike',
  description:
    %{<p>
      This is a great bike, fast on the road and in the woods.
      </p>},
  image_url: 'canondale.jpg',
  price: 1299
)
