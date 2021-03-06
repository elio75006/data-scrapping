require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def scrapper
  parsed_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   ##Define the page we want to parse
  money_name_and_price = []
  name = []
  price = []
  #get_datas = parsed_page.css('tbody')## target the block containing datas
  
    parsed_page.css('tr.cmc-table-row  > td:nth-child(3) > div').each do |scrap|
    name.push(scrap.content)
  end
  parsed_page.css('tr.cmc-table-row  > td:nth-child(5) > div > a').each do |scrap|
    price.push(scrap.content)
  end
  money_name_and_price = Hash[name.zip(price)]
  money_name_and_price.each do |key, value|
  puts key + ' : ' + value
  end
  return money_name_and_price
end

scrapper
  

 # => Nokogiri::HTML::Document
 
# get_datas.each do |data_list|
#    name_and_price = {
#      name: data_list.css('tr.cmc-table-row > td:nth-child(3) > div').text,
#      price: data_list.css('tr.cmc-table-row > td:nth-child(5) > div > a').text.to_s,
#    }
#name_and_price_hash = Hash[name(price)]
#name_and_price_hash.each do |key, value|
#puts key + ' = ' + value
# name.each_with_index { |key, index| name_and_price_hash << {name: key, values: price[index]} }
# name_and_price_hash.zip(price).map { |k, i| {name: name, price: price} }
