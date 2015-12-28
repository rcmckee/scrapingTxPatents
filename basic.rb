require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'
BASE_URL = 'http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&u=%2Fnetahtml%2FPTO%2Fsearch-adv.htm&r='
ENDING_URL = '&p=1&f=G&l=50&d=PTXT&S1=(%22TX%22.ASST.)&OS=AS/TX&RS=AS/TX'

BASE_DIR = '/catalog/raw/?&page='
LOCAL_DIR = 'data-hold/datagov-pages'


$i = 1
$numOfPatents = 1   #160312

until $i > $numOfPatents  do
	
   PAGE_URL = BASE_URL+"#{$i}"+ENDING_URL
   page = Nokogiri::HTML(open(PAGE_URL))
   puts page

#body table[2] tbody tr [2] th.text(Assignee) td.text tr[4] th.text(app_num) td.text tr[5] th.text(filed) td.text
#   

   $i +=1
end

#open first page and pring out the html
#page = Nokogiri::HTML(open(FIRST_URL))



