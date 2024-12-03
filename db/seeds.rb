require "open-uri"

p "Cleaning the DB"
UserGroup.destroy_all
User.destroy_all
Group.destroy_all
Poll.destroy_all

  p"Creating user"
  user = User.create!(email: "email@gmail.com", password: "123456")
  file = URI.parse("https://previews.123rf.com/images/thesomeday123/thesomeday1231712/thesomeday123171200009/91087331-ic%C3%B4ne-de-profil-d-avatar-par-d%C3%A9faut-pour-le-m%C3%A2le-espace-r%C3%A9serv%C3%A9-photo-gris-vecteur-d.jpg").open
  user.avatar.attach(io: file, filename: "avatar_defaut.jpg", content_type: "image/jpg")
  user.save!

  user = User.create!(email: "sami@gmail.com", password: "123456")
  file = URI.parse("https://avatars.githubusercontent.com/u/184087991?v=4").open
  user.avatar.attach(io: file, filename: "samiseed.jpeg", content_type: "image/jpg")
  user.save!


  user = User.create!(email: "aurelie@gmail.com", password: "123456")
  file = URI.parse("https://avatars.githubusercontent.com/u/183479320?v=4").open
  user.avatar.attach(io: file, filename: "aurelieseed.jpeg", content_type: "image/jpg")
  user.save!


  user = User.create!(email: "adrien@gmail.com", password: "123456")
  file = URI.parse("https://avatars.githubusercontent.com/u/181247568?v=4").open
  user.avatar.attach(io: file, filename: "adrienseed.jpeg", content_type: "image/jpg")
  user.save!


  user = User.create!(email: "julia@gmail.com", password: "123456")
  file = URI.parse("https://avatars.githubusercontent.com/u/181855651?v=4").open
  user.avatar.attach(io: file, filename: "juliaseed.jpeg", content_type: "image/jpg")
  user.save!

  p "Creating group"
  group = Group.new(title: "Nîmes", description: "Préparez-vous à vivre une aventure mémorable à Nîmes pour célébrer les 50 ans de Jean-Mich ! Entre fiesta le soir et descente en canoë kayak sous le pont du gard et visites des arènes de Nîmes la journée, nous n'allons pas beaucoup dormir ! Faîtes de cet anniversaire un moment inoubliable pour notre Jean-Mich' national ! 🥂✨🧁", owner: User.all.sample)
  file = URI.parse("https://www.terres-chiliennes.com/uploads/sites/14/2020/06/glacier-perito-moreno-argentine-730x520.jpeg").open
  group.cover_banner.attach(io: file, filename: "nimes.jpg", content_type: "nimes/jpg")
  group.save!
  #group = Group.create!(title: "villa fin de saison", description: "recherche d'une villa pour la fin de saison", cover_banner: "https://tcsvoyages.ch/wp-content/uploads/2020/03/photo-titre-ou-partir-en-ete_pixabay-1620x1080.jpg", owner: User.all.sample)

  p "Creating group"
  group = Group.new(title: "Découverte du Larzac", description: "Partons à la découverte du Larzac en été 2025 ! Partons à l'aventure sur le plateau du Larzac! Entre paysages sauvages, villages authentiques et dégustations de fromages locaux, allons ensemble explorer cette région emblématique de l'Aveyron. Randonnées, visites de fermes et moments conviviaux au programme pour un week-end ressourçant au cœur de la nature. 💚🏕️🌿🌲🌳☘️", owner: User.all.sample)
  file = URI.parse("https://www.explore-millau.com/app/uploads/millau-tourisme/2023/10/thumbs/paysages-du-larzac-pnrgc-640x480.jpg").open
  group.cover_banner.attach(io: file, filename: "larzac.jpg")
  group.save

  p "Creating group"
  group = Group.new(title: "Anniversaire, 30 ans Adeline", description: "Viens danser jusqu'au bout de la nuit pour fêter les 30 ans d'Adeline ! Une soirée chic, festive et pleine de surprises, entourée de tous ses amis !! 💃🏻🎉🥂🫂" , owner: User.all.sample)
  file = URI.parse("https://www.partybus.fr/wp-content/uploads/2018/03/VISUEL-ANNIVERSAIRE-1.jpg").open
  group.cover_banner.attach(io: file, filename: "anniv.jpg", content_type: "image/jpg")
  group.save

  p "Creating group"
  group = Group.new(title: "EVJF Amandine Toulouse", description: "Un week-end de folie pour célébrer les derniers jours de célibat d’Amandine dans la ville rose ! Soirées électrisantes et souvenirs inoubliables… Ce qui se passe à Toulose reste à Toulouse. 🤫🍑🪩🍸🏝️", owner: User.all.sample)
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
