require "open-uri"

p "Cleaning the DB"
User.destroy_all
Group.destroy_all
Poll.destroy_all

p"Creating user"
User.create!(email: "email@gmail.com", password: "123456")
User.create!(email: "sami@gmail.com", password: "123456")
User.create!(email: "aurelie@gmail.com", password: "123456")
User.create!(email: "adrien@gmail.com", password: "123456")
User.create!(email: "julia@gmail.com", password: "123456")

  p "Creating group"
  group = Group.new(title: "Chili", description: "Préparez-vous à vivre une aventure mémorable au Chili pour célébrer les 50 ans de Jean-Mich ! Entre glaciers majestueux, vignes chiliennes et soirées endiablées, ce voyage restera gravé dans nos mémoires. ✈️🥂✨🧁", owner: User.all.sample)
  file = URI.parse("https://www.terres-chiliennes.com/uploads/sites/14/2020/06/glacier-perito-moreno-argentine-730x520.jpeg").open
  group.cover_banner.attach(io: file, filename: "chili.jpeg", content_type: "image/jpg")
  group.save!
  #group = Group.create!(title: "villa fin de saison", description: "recherche d'une villa pour la fin de saison", cover_banner: "https://tcsvoyages.ch/wp-content/uploads/2020/03/photo-titre-ou-partir-en-ete_pixabay-1620x1080.jpg", owner: User.all.sample)

  p "Creating group"
  group = Group.new(title: "Mexico, verano 2025", description: "Partons à la découverte du Mexique en été 2025 ! Au programme : tacos, plages de rêve, pyramides aztèques et aventures entre amis. ¡Viva México carajooo! 🗺️🚘🛣️🌶️🌮🌵", owner: User.all.sample)
  file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1200px-Flag_of_Mexico.svg.png").open
  group.cover_banner.attach(io: file, filename: "mexico.png")
  group.save

  p "Creating group"
  group = Group.new(title: "Anniversaire, 30 ans Adeline", description: "Viens danser jusqu'au bout de la nuit pour fêter les 30 ans d'Adeline ! Une soirée chic, festive et pleine de surprises, entourée de tous ses amis !! 💃🏻🎉🥂🫂" , owner: User.all.sample)
  file = URI.parse("https://www.partybus.fr/wp-content/uploads/2018/03/VISUEL-ANNIVERSAIRE-1.jpg").open
  group.cover_banner.attach(io: file, filename: "anniv.jpg", content_type: "image/jpg")
  group.save

  p "Creating group"
  group = Group.new(title: "EVJF Amandine Ibiza", description: "Un week-end de folie pour célébrer les derniers jours de célibat d’Amandine ! Plages paradisiaques, soirées électrisantes et souvenirs inoubliables… Ce qui se passe à Ibiza reste à Ibiza. 🤫🍑🪩🍸🏝️", owner: User.all.sample)
  file = URI.parse("https://www.evjfdeauville.com/wp-content/uploads/2020/02/organiser-un-evjf-a-deauville.jpeg").open
  group.cover_banner.attach(io: file, filename: "evjf.jpg")
  group.save

  p "Creating group"
  group = Group.new(title: "Week end camping à la montagne", description: "Un week-end en pleine nature pour se ressourcer ! Au programme : randonnées au sommet, veillées autour du feu et une bonne raclette en plein air pour les amateurs de fromage. 🧀🥔🫕🏔️🎒🏕️📸", owner: User.all.sample)
  file = URI.parse("https://camperstyle.fr/wp-content/uploads/2023/10/camping-gadgets-1280x853.jpg").open
  group.cover_banner.attach(io: file, filename: "camping.jpg")
  group.save




# begin p "Creating poll"
# poll_budget = Poll.create!(title: "test budget", category: 0, state: 0, group: group)

# poll_dates = Poll.create!(title: "test dates", category: 10, state: 10, group: group)

# poll_destination = Poll.create!(title: "test destination", category: 20, state: 20, group: group)

# poll_hebergement = Poll.create!(title: "test hebergement", category: 30, state: 0, group: group) =end

# p "Finished"
# p "#{Group.count} groups"
# p "#{Poll.count} polls"
