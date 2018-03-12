require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'

@pager = 0;
@remote_domain = 'https://blog.hellosanta.com.tw';
@url = @remote_domain + '/css_research';
@data_json = [];

def ajax_url(url,pager) 
    @HTML = open("#{url}?page=#{pager}").read;
    @current_page = Nokogiri::HTML(@HTML);
    @views_data = @current_page.search('.view-css-research .view-content ul');
end

ajax_url(@url,@pager);

while @views_data.length != 0
    for i in @views_data.css('li') do
        @data_json.push({
            title: i.css('.title a').text,
            link: @remote_domain + i.css('.title a').first['href'],
            author: i.css('.username').text,
            img_url: i.css('.views-field-field-main-image img').first['src'],
        }); 
    end
    @pager += 1;
    ajax_url(@url,@pager);
end

File.open("crawler.json","w") do |f|
  f.write(@data_json.to_json)
end
