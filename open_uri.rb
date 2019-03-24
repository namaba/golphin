# require 'open-uri'
require 'anemone'
require 'nokogiri'
require 'kconv'


urls = []
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466282/")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    puts doc.xpath("//*[@id='zg_browseRoot']")
    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text
    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text
    puts category + "/" + sub_category
  end
end