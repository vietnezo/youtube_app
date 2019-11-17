module HomeHelper
  def movie_info(url)
    VideoInfo.new(url)
  end
end
