module HomeHelper
  def make_youtube_embed_link(youtube_url)
    youtube_id = YouTubeRails.extract_video_id(youtube_url) || youtube_url
    "https://www.youtube.com/embed/#{youtube_id}"
  end
end
