require 'nokogiri'
require 'open-uri'


class CompanyInfo
  def initialize(ticker_code)
    @baseUrl = 'https://stocks.finance.yahoo.co.jp/stocks'
    @tickerCode = ticker_code
    scrape
  end

  attr_reader :name, :tickerCode, :category, :unit, :recentHighPrice, :recentLowPrice, :highPrice, :lowPrice, :lowPrice

  private
  def get_company_info()
    url = "#{@baseUrl}/profile/?code=#{@tickerCode}"
    doc = get_nokogiri_doc(url)
    @name = doc.xpath("//th[@class='symbol']/h1").text
    @category = doc.xpath("//dd[@class='category yjSb']/a").text
    @unit = doc.xpath("//table[@class='boardFinCom marB6']/tr[13]/td").text
  end

  def get_nokogiri_doc(url)
    begin
      html = open(url)
    rescue OpenURI::HTTPError
      return
    end
    Nokogiri::HTML(html, nil, 'utf-8')
  end

  def get_stock_info
    url = "#{@baseUrl}/detail/?code=#{@tickerCode}"
    doc = get_nokogiri_doc(url)
    @recentHighPrice =
      doc.xpath("//*[@id='rfindex']/div[2]/div[11]/dl/dd/strong").text
    @recentLowPrice =
      doc.xpath("//*[@id='rfindex']/div[2]/div[12]/dl/dd/strong").text
    @highPrice =
      doc.xpath("//*[@id='detail']/div[2]/div[3]/dl/dd/strong").text
    @lowPrice =
      doc.xpath("//*[@id='detail']/div[2]/div[4]/dl/dd/strong").text
    @price =
      doc.xpath("//td[@class='stoksPrice']").text
  end

  def scrape
    get_company_info
    get_stock_info
  end
end

company = CompanyInfo.new('4689')
puts company.name
puts company.category
puts company.unit
puts company.recentHighPrice
puts company.recentLowPrice
puts company.highPrice
puts company.lowPrice
puts company.price
