
namespace :db do
  desc "This task does nothing"
  task :import => :environment do

    def get_html(url)
      html_body = Curl.get(url).body_str
      Nokogiri::HTML(html_body)
    end

    def get_authors
      site_overview = get_html("http://www.aphorism4all.com/by_author.php")

      site_overview.css('#content a').each do |node|
          Author.find_or_create_by(
            first_name: node.inner_text.strip.split("  ")[1],
            last_name: node.inner_text.strip.split("  ")[0],
            url: node.attr('href')
          )
      end
    end



    #TODO: don't include the last node "Pages"
    #TODO: Loop over multiple sites
    #get aphorisms for author
    def get_aphorisms
      Author.all.each do |author|
        site_author = get_html("http://www.aphorism4all.com/" + author.url)
        site_author.css('#content strong').each do |node|
          author.aphorisms.create(aphorism: node.inner_text)
        end
      end
    end

    get_authors
    get_aphorisms

    # Seriously, nothing
  end
end
