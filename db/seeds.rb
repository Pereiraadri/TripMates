require "open-uri"

p "Cleaning the DB"
User.destroy_all
Group.destroy_all
Poll.destroy_all

p"Creating user"
user = User.create!(email: "email@gmail.com", password: "123456")

p "Creating group"
group = Group.new(title: "Chili", description: "Let's go féter les 30 ans de Jean-Mich", owner: user)
file = URI.parse("https://www.terres-chiliennes.com/uploads/sites/14/2020/06/glacier-perito-moreno-argentine-730x520.jpeg").open
group.cover_banner.attach(io: file, filename: "chili.jpeg", content_type: "image/jpg")
group.save!
#group = Group.create!(title: "villa fin de saison", description: "recherche d'une villa pour la fin de saison", cover_banner: "https://tcsvoyages.ch/wp-content/uploads/2020/03/photo-titre-ou-partir-en-ete_pixabay-1620x1080.jpg", owner: user)

p "Creating poll"
poll_budget = Poll.create!(title: "test budget", category: 0, state: 0, group: group)

poll_dates = Poll.create!(title: "test dates", category: 10, state: 10, group: group)

poll_destination = Poll.create!(title: "test destination", category: 20, state: 20, group: group)

poll_hebergement = Poll.create!(title: "test hebergement", category: 30, state: 0, group: group)

p "Finished"
p "#{Group.count} groups"
p "#{Poll.count} polls"
