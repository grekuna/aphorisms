class CalvinController < ApplicationController

  def index
    html_body = Curl.get("http://calvinhobbesdaily.tumblr.com/").body_str
    site = Nokogiri::HTML(html_body)
    origin_url= site.css('.stat-media-wrapper a').attr('href').value

    origin_body = Curl.get(origin_url).body_str
    origin = Nokogiri::HTML(origin_body)
    @image_url = origin.css('.image-page-style-image--1XCzC').attr('src').value

  end
end