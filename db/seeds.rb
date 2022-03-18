# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(username: "Zeus", password: "password")

50.times do 
  Sub.create(title: Faker::Kpop.boy_bands, description: Faker::Books::Dune.quote, 
              moderator_id: admin.id)

end

i = 2
200.times do
  Post.create(title: Faker::Books::Lovecraft.deity, content: Faker::Books::Lovecraft.paragraphs, sub_id: i, author_id: 7)
  i = (i + 1) % 50
end