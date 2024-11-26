p "Cleaning the DB"
User.destroy_all
Group.destroy_all
Poll.destroy_all

p"Creating user"
user = User.create!(email: "email@gmail.com", password: "123456")

p "Creating group"
group = Group.create!(title: "villa fin de saison", description: "recherche d'une villa pour la fin de saison", cover_banner: "https://tcsvoyages.ch/wp-content/uploads/2020/03/photo-titre-ou-partir-en-ete_pixabay-1620x1080.jpg", owner: user)

p "Creating poll"
poll = Poll.create!(title: "test", category: 0, state: 0, group: group)

p "Finished"
p "#{Group.count} groups"
p "#{Poll.count} polls"
