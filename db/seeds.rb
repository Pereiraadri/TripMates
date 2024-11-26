p "Cleaning the DB"
User.destroy_all
user = User.create!(email: "email@gmail.com", password: "123456")
