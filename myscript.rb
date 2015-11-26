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


