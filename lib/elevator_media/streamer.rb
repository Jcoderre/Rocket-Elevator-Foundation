# require 'rails_helper'
require 'uri'
require 'net/http'
require 'openssl'

module ElevatorMedia
    class Streamer 
        def self.bing_news_streamer        
            url = URI("https://bing-news-search1.p.rapidapi.com/news?safeSearch=Off&textFormat=Raw")
            
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-bingapis-sdk"] = 'true'
            request["x-rapidapi-key"] = '02fcb00b00mshca77b871d58f815p1b82d4jsn385d5be92e0a'
            request["x-rapidapi-host"] = 'bing-news-search1.p.rapidapi.com'
            
            response = http.request(request)
            JSON.parse(response.read_body)
        end

            
        def self.getContent()
            puts "GETCONTENT"
            content = "<div><p>"
            news = bing_news_streamer['value'][0]
            content = content + '<p>' + news['name'] + "</p>"
            content = content + news['description'] + "</div>"
            content = content + "<div><p>" + news['datePublished']+ '</p>'"</div>"
            content
        end
    end
end
