# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'seeding merchandiser'
Merchandiser.create(username: "Kyle M. Miller",role:"merchandisers", image: "https://images.unsplash.com/photo-1616002411355-49593fd89721?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFzc3BvcnQlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", email: "kyle@gmail.com", phone_number: 712000000,  password_digest: "123", location: "Ngara")
Merchandiser.create(username: "Laura K. Dean",role:"merchandisers",  image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60", email: "laura@gmail.com", phone_number: 734000000, password_digest: "1234", location: "Pangani")
Merchandiser.create(username: "Jason A. Woods",role:"merchandisers",  image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60", email: "jason@gmail.com", phone_number: 756000000, password_digest: "12345", location: "Embakasi")
Merchandiser.create(username: "Jasmine Hogan",role:"merchandisers",  image: "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60", email: "jasmine@gmail.com", phone_number: 778000000,  password_digest: "123456", location: "Karen")
Merchandiser.create(username: "Kenneth R. Wiley",role:"merchandisers",  image: "https://images.unsplash.com/photo-1531727991582-cfd25ce79613?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmxhY2slMjBwZW9wbGUlMjBmYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60", email: "kenneth@gmail.com", phone_number: 790000000,  password_digest: "1234567", location: "Roysambu")

puts 'seeding manager'
Manager.create(username: "Joseph K. Williams",role:"managers", image: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60", email: "joseph@gmail.com", phone_number: 712345000, password_digest: "1234a", location: "Moi Avenue")
Manager.create(username: "Nathaniel A. Longoria",role:"managers",  image: "https://images.unsplash.com/photo-1602133187081-4874fdbd555c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGFzc3BvcnQlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60", email: "nathaniel@gmail.com", phone_number: 712678000, password_digest: "1234b", location: "Tom Mboya Street")

puts "seeding outlet"
Outlet.create(name: "Naivas Moi Avenue", location:"Development House, Moi Avenue")
Outlet.create(name: "Carrefour Mega", location:"Carrefour Mega")
Outlet.create(name: "Chandarana Foodplus Supermarkets Ngara", location:"Parklands/Highridge")
Outlet.create(name: "Mathai Supermarket Ltd", location:"Ronald Ngala St · In NNUS Bus Service")

puts "seeding routeplan"
RoutePlan.create(route_name: "routeA",merchandiser: "Kyle M. Miller",outlets: "Naivas Moi Avenue, Mathai Supermarket Ltd",location: "Moi Avenue",time: "9am-3pm")
RoutePlan.create(route_name: "routeB",merchandiser: "Laura K. Dean",outlets: "Carrefour Mega, Chandarana Foodplus Supermarkets Ngara", location: "Parklands",time: "9am-3pm")



puts "done seeding"
