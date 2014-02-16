# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Product.delete_all

Product.create!(title: 'McFarlane NFL Series 10 Joe Montana',
  description:
    %{<p>
	  Series 10 of the World famous collectible figures. Joe Montana with the San Francisco 49ers.
	  </p>},
  image_url: 'mf_montana.jpg',
  price: 22.95)
  
Product.create!(title: 'McFarlane NBA Series 1 Allen Iverson',
  description:
    %{<p>
	  Series 1 of the World famous collectible figures. The Answer with the Philadelphia 76ers.
	  </p>},
  image_url: 'mf_montana.jpg',
  price: 18.95)
