class CalvinController < ApplicationController

  def index
    # html_body = Curl.get("http://calvinhobbesdaily.tumblr.com/").body_str
    # site = Nokogiri::HTML(html_body)
    # origin_url= site.css('.stat-media-wrapper a').attr('href').value

    # origin_body = Curl.get(origin_url).body_str
    # origin = Nokogiri::HTML(origin_body)
    # @image_url = origin.css('.image-page-style-image--1XCzC').attr('src').value
    rss = SimpleRSS.parse open('https://www.comicsrss.com/rss/calvinandhobbes.rss')
    @description_string = rss.items.first.description
    @image_url = @description_string.split(" ")[2][5..-2] 
    rss = SimpleRSS.parse open('https://www.comicsrss.com/rss/dilbert-classics.rss')
    @description_string = rss.items.first.description
    @image_url2 = @description_string.split(" ")[2][5..-2] 
    



  end
end
