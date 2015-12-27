require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'
Base_URL = 'http://patft.uspto.gov'
FIRST_URL = Base_URL+'/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&u=%2Fnetahtml%2FPTO%2Fsearch-adv.htm&r=0&p=1&f=S&l=50&Query=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&d=PTXT'
Base2_URL = '/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&u=%2Fnetahtml%2FPTO%2Fsearch-adv.htm&r=0&f=S&l=50&d=PTXT&OS=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&RS=%28AAST%2FTX+AND+APD%2F201401%24-%3E201511%24%29&Query=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&TD=1850&Srch1=%28%28%22TX%22.AAST.%29+AND+%40AD%3E%3D20140100%3C%3D20151131%29&NextList'
ENDING_URL = '=Next+50+Hits'
BASE_DIR = '/catalog/raw/?&page='
LOCAL_DIR = 'data-hold/datagov-pages'

page = Nokogiri::HTML(open(FIRST_URL))
puts page
#rows = page.css('******************************then run this')
#
#rows[1..-2].each do |row|
#	hrefs = row.css('td a').map{ |a|
#		a['href'] 
#	}.compact.uniq
#
#	hrefs.each do |href|
#		puts href
#	end
#end