class ApiScrapper
  require 'open-uri'
  require 'json'

  def initialize(url)
    @url = url
    @api_url = 'https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&'
    @api_url_videos = 'https://www.googleapis.com/youtube/v3/search?order=relevance&part=snippet&channelId='
  end

  def analyze_url
    pattern = /(?:https|http)\:\/\/(?:[\w]+\.)?youtube\.com\/((?:c\/|channel\/|user\/))?([a-zA-Z0-9\-\_]{1,})/
    regex = @url.match(pattern)
    if regex[1] == "user/"
      @youtube_username = regex[2]
      return @youtube_username
    elsif regex[1] == "channel/"
      @youtube_id = regex[2]
      return @youtube_id
    end
  end

  def scrape
    analyze_url
    if @youtube_id.nil?
      url = @api_url + 'forUsername=' + @youtube_username + "&key=#{ENV["YOUTUBE_API_KEY"]}"
      # url = @api_url + 'forUsername=' + @youtube_username + '&key=AIzaSyBXB3cRp_EAO4kRoCn0tFqDx1-5j4UuiFU'
    elsif @youtube_username.nil?
      url = @api_url + 'id=' + @youtube_id + "&key=#{ENV["YOUTUBE_API_KEY"]}"
      # url = @api_url + 'id=' + @youtube_id + '&key=AIzaSyBXB3cRp_EAO4kRoCn0tFqDx1-5j4UuiFU'
    end
    info_serialized = open(url).read
    info = JSON.parse(info_serialized)
    if info["items"].empty?
      return nil
    else
      # Id
      id = info["items"][0]["id"]

      # Snippets
      snippet = info["items"][0]["snippet"]
      title = snippet["title"]
      avatar = snippet["thumbnails"]["default"]["url"]

      # Statistics
      stats = info["items"][0]["statistics"]
      view_count = stats["viewCount"]
      subscriber_count = stats["subscriberCount"]
      video_count = stats["videoCount"]

      # Videos
      url_videos = @api_url_videos + id + "&maxResults=5&key=#{ENV["YOUTUBE_API_KEY"]}"
      # url_videos = @api_url_videos + id + '&maxResults=5&key=AIzaSyBXB3cRp_EAO4kRoCn0tFqDx1-5j4UuiFU'
      puts url_videos
      video_serialized = open(url_videos).read
      video = JSON.parse(video_serialized)

      videos = []
      items = video["items"]
      items.each do |item|
        videos << item["id"]["videoId"]
      end

      return {
        channel_url: @url,
        channel_id: id,
        youtube_name: title,
        remote_avatar_photo_url: avatar,
        view_count: view_count,
        nb_followers: subscriber_count,
        nb_videos: video_count,
        top_videos: videos
      }
    end
  end
end

puts ApiScrapper.new('https://www.youtube.com/channel/UC-XlvkxWeSMLjjuIe3Zks2').scrape

