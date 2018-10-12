class AphorismsController < ApplicationController

  def index
     @author = Author.find(rand(0..Author.all.count-1))
     @aphorism = @author.aphorisms.find(rand(@author.aphorisms.first.id..@author.aphorisms.last.id)).aphorism
  end

  def start
    # html_body = Curl.get("http://calvinhobbesdaily.tumblr.com/").body_str
    # site = Nokogiri::HTML(html_body)
    # origin_url= site.css('.stat-media-wrapper a').attr('href').value

    # origin_body = Curl.get(origin_url).body_str
    # origin = Nokogiri::HTML(origin_body)
    # @image_url = origin.css('._1XCzC').attr('src').value

    #Bug scraping works locally but not on heroku

    # html_body = Curl.get("http://calvinandhobbes-daily.tumblr.com/").body_str
    # site = Nokogiri::HTML(html_body)
    # @image_url= site.css('img').first.attr('src')
    
    rss = SimpleRSS.parse open('https://www.comicsrss.com/rss/calvinandhobbes.rss')
    @description_string = rss.items.first.description
    @image_url = @description_string.split(" ")[2][5..-2] 
    @author = Author.find(rand(0..Author.all.count-1))
    @aphorism = @author.aphorisms.find(rand(@author.aphorisms.first.id..@author.aphorisms.last.id)).aphorism
  end

end
