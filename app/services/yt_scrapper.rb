class Scrapper
  require 'nokogiri'
  require 'open-uri'

  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def scrape
    html_file = open(@youtube_url).read
    html_doc = Nokogiri::HTML(html_file)

    puts html_doc.xpath('//span[id="channel-title"]').text

    #binding.pry
    # avatar = request...
    # nom = request...

    # return {
    #   avatar: xxx,
    #   nom: xxx
    # }
  end
end

Scrapper.new('https://www.youtube.com/user/leclubofficiel/').scrape
