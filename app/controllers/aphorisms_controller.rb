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
    unless (html_body = Curl.get("http://calvinandhobbes-daily.tumblr.com/").body_str == nil)
      html_body = Curl.get("http://calvinandhobbes-daily.tumblr.com/").body_str
      site = Nokogiri::HTML(html_body)
      @image_url= site.css('img').first.attr('src')
    else 
      @image_url= "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2000px-Solid_white.svg.png"
    end
 

    @author = Author.find(rand(0..Author.all.count-1))
    @aphorism = @author.aphorisms.find(rand(@author.aphorisms.first.id..@author.aphorisms.last.id)).aphorism
  end

end
