require 'nokogiri'

# URLに簡単にアクセスできるようにするためのライブラリ
require 'open-uri'
# CSV出力をできるようにするためのライブラリ
require 'csv'



url = 'https://qiita.com/search?q=ruby'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//h1[@class="searchResult_itemTitle"]').each do |node|
  p node.css('a').inner_text
end
