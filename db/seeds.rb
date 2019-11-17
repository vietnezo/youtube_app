# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Dummy first user
if User.find_by(email: "funnymovie@gmail.com").nil?
  user = User.create(
    email: "funnymovie@gmail.com",
    password: "funnymovie",
    confirmed_at: DateTime.current
  )

  [
    "https://www.youtube.com/watch?v=exEduZlJS7Q&list=PLDmvslp_VR0xlwr5lAx2PDsZLu7oIOhpX",
    "https://www.youtube.com/watch?v=UT4W6jAyO_o&list=PLDmvslp_VR0xlwr5lAx2PDsZLu7oIOhpX&index=2",
    "https://www.youtube.com/watch?v=i8sxeP03B5s&list=PLDmvslp_VR0xlwr5lAx2PDsZLu7oIOhpX&index=3",
    "https://www.youtube.com/watch?v=1d6rnWRb_7k&list=PLDmvslp_VR0xlwr5lAx2PDsZLu7oIOhpX&index=4"
  ].each do |url|
    movie_info = VideoInfo.new(url)
    user.movies.create(
      url: url,
      title: movie_info&.title,
      description: movie_info&.description
    )
  end
end

