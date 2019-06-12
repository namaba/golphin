require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

search_word = URI.encode('cat')
doc = Nokogiri::HTML(open(
  "https://www.flickr.com/search/?q=#{search_word}"))
img = doc.xpath("//div[@class='view photo-list-photo-view requiredToShowOnServer awake']").first
m = img.attributes['style'].value.match(/background-image: url\((.*)\)/)
pp m[1]
file = File.basename(m[1])
pp file
# doc.xpath("//div[@class='view photo-list-photo-view requiredToShowOnServer awake']").each {|link|
#   puts link['background-image']
# }

