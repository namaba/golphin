require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

escaped_uri = URI.escape(
  "https://www.google.com/search?q=クローラー&oe=urf-8&hl=ja")
doc = Nokogiri::HTML(open(escaped_uri))

puts doc.xpath("//*[@id='resultStats']/text()")

puts doc.xpath('//h3').to_html
# doc.xpath('//h3/a').each do |link|
#   puts link.to_s
#   # puts link.content
# end
