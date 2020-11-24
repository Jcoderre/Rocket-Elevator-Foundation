require 'uri'
require 'net/http'
require 'openssl'
class Streamer 

    def bing_news_streamer        
        url = URI("https://bing-news-search1.p.rapidapi.com/news?safeSearch=Off&textFormat=Raw")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-bingapis-sdk"] = 'true'
        request["x-rapidapi-key"] = '02fcb00b00mshca77b871d58f815p1b82d4jsn385d5be92e0a'
        request["x-rapidapi-host"] = 'bing-news-search1.p.rapidapi.com'
        
        response = http.request(request)
        puts response.read_body
    end


    def self.add(input)
        if input.empty?
            0
        else 
            numbers = input.split(",").map { |num| num.to_i }
            numbers.inject(0) { |sum, number| sum + number }
        end
    end

end