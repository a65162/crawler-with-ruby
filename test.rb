require 'nokogiri'
require 'open-uri'
require 'pry'


# books = Nokogiri::HTML(open('https://blog.hellosanta.com.tw/css_research'))
# puts "### Search for nodes by css with Bookstore"
# books.css('.view-css-research .views-field-title a').each do |link|
#   puts link.content
# end

@pager = 0;
@page = [];

def ajax_url(url,pager) 
    @HTML = open("#{url}?page=#{pager}").read;
    @book = Nokogiri::HTML(@HTML);
end

# '{}?page={currentpage}'
ajax_url('https://blog.hellosanta.com.tw/css_research',@pager);

@lis = @book.css('.view-css-research .view-content ul li');

if @lis
    puts 'asdas'
end
# @li.each do |li|
#     @title = li.css('.views-field-title a').text
#  end

 binding.pry 
#  open("https://blog.hellosanta.com.tw/css_research?page=1").read;