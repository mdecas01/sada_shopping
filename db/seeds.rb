# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!([
	              {
	                name: "Folding chair",
                    description: "Easy to store, folding chair",
                    price: 10.99,
                    quantity: 1,
                    image_url: "folding-chair.jpg"
                  },
                  {
                    name: "Coffe table 2",
                    description: "Strong and easy to assemble",
                    price: 20.99,
                    quantity: 1,
                    image_url: "coffe-table.jpg"
                  },
                  {
                  	name: "Office chair",
                    description: "Resistent and confortable",
                    price: 37.89,
                    quantity: 1
                    
                  },
                  {
                  	name: "New sofa",
                    description: "Confortable and stilish ",
                    price: 129.89,
                    quantity: 1
                  }
                ])	

User.create!([
                name: "Rodrigo Castro",
                email: "romacas@hotmail.co.uk",
                password: "supersecret",
                password_confirmation: "supersecret",
                admin: true 
            ])

Category.create!([
	            {
	               name: "Home",
	               level: 1,
	               parent: nil 
	            },
	             {
	               name: "Forniture",
	               level: 2,
	               parent: 1 
	            },
	             {
	               name: "Tables & chairs",
	               level: 3,
	               parent: 2 
	            }
               ])



