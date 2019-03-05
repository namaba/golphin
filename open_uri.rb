# require 'open-uri'
# require 'nokogiri'

# open("https://docs.ruby-lang.org/ja/2.5.0/doc/index.html") { |f|
#   f.each_line {|line| p line}
# }

# doc = Nokogiri.HTML(open('http://nokogiri.org/'))
#
# doc.css('a').each do |element|
#   puts element[:href]
# end
#

require 'anemone'
#
# Anemone.crawl('https://www.yahoo.co.jp/') do |anemone|
#   anemone.skip_links_like /admin/
#   anemone.on_every_page do |page|
#     puts page.url
#   end
# end

Anemone.crawl('http://www.amazon.co.jp/gp/bestsellers/', :depth_limit => 1) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if { |link| link.to_s.match(/bestsellers/) }
  end
  anemone.on_every_page do |page|
    puts page.links
  end
end