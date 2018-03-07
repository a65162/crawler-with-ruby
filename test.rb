require 'nokogiri'
require 'open-uri'


# books = Nokogiri::HTML(open('https://blog.hellosanta.com.tw/css_research'))
# puts "### Search for nodes by css with Bookstore"
# books.css('.view-css-research .views-field-title a').each do |link|
#   puts link.content
# end

@increment = 1;
@data = [];

def ajax_url(url,currentpage) 
    books = Nokogiri::HTML(open(url+'?page='+currentpage))
end
# '{}?page={currentpage}'
ajax_url('https://blog.hellosanta.com.tw/css_research',@increment);