require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'
Base_URL = 'http://patft.uspto.gov'
FIRST_URL = '/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&u=%2Fnetahtml%2FPTO%2Fsearch-adv.htm&r=0&p=1&f=S&l=50&Query=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&d=PTXT'
Base2_URL = '/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&u=%2Fnetahtml%2FPTO%2Fsearch-adv.htm&r=0&f=S&l=50&d=PTXT&OS=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&RS=%28AAST%2FTX+AND+APD%2F201401%24-%3E201511%24%29&Query=AAST%2FTX+and+APD%2F1%2F%24%2F2014-%3E11%2F%24%2F2015&TD=1850&Srch1=%28%28%22TX%22.AAST.%29+AND+%40AD%3E%3D20140100%3C%3D20151131%29&NextList'
ENDING_URL = '=Next+50+Hits'
BASE_DIR = '/catalog/raw/?&page='
LOCAL_DIR = 'data-hold/datagov-pages'




#for each page of results FIRST_URL then Base2_URL (37 pages total, 36 after the FIRST_URL)

	#for each row take the first href and click it

		#download that html code (parse it later)

#parse each file for company name, inventors, city, 


DATA_DIR = "data-hold/txPatents"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

page = Nokogiri::HTML(open(Base_URL+FIRST_URL))
rows = page.css('tr')

rows[1..].each do |row|
  
  hrefs = row.css("td a").first #I think the .first is a nokogirie thing where it just gets the first one of the set. no clue. but I will never know until I try.
  
  hrefs.each do |href|
    remote_url = Base_URL + href
    local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
    unless File.exists?(local_fname)
      puts "Fetching #{remote_url}..."
      begin
        patent_content = open(remote_url, HEADERS_HASH).read
      rescue Exception=>e
        puts "Error: #{e}"
        sleep 5
      else
        File.open(local_fname, 'w'){|file| file.write(patent_content)}
        puts "\t...Success, saved to #{local_fname}"
      ensure
        sleep 1.0 + rand
      end  # done: begin/rescue
    end # done: unless File.exists?
    
  end # done: hrefs.each

  #######for each row do that then stop at http://patft.uspto.gov/netaicon/PTO/ftext.gif  and go to next row
end # done: rows.each