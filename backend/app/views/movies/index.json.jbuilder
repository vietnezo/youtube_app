json.array! @movies do |movie|
  json.id movie.id
  json.title movie.title
  json.description movie.description
  json.user_email movie.user.email
  json.src VideoInfo.new(movie.url)&.embed_code
end
