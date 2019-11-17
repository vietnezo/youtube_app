# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Dummy first user
if User.find_by(email: "funnymovie@gmail.com").nil?
  User.create(
    email: "funnymovie@gmail.com",
    password: "funnymovie",
    confirmed_at: DateTime.current
  )
end
