# coding: utf-8
#
# Usage:
#   ruby dictionalization.rb > unity_script.dict
#

require 'nokogiri'
require 'open-uri'
require 'set'

URLS = [
  "http://docs.unity3d.com/Documentation/ScriptReference/10_reference.Classes.html",
  "http://docs.unity3d.com/Documentation/ScriptReference/10_reference.Enumerations.html"
]

dict = Set.new
URLS.each {|url|
  (Nokogiri::HTML.parse(open(url))/"div.scriprefmain ul li a").each {|e|
    dict << e.inner_text
  }
}

dict.sort.each {|w| puts w }


