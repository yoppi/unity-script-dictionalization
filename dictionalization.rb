# coding: utf-8
#
# Usage:
#   ruby dictionalization.rb > unity_script.dict
#

require 'nokogiri'
require 'open-uri'
require 'set'

REFERENCE_ROOT = "http://docs.unity3d.com/Documentation/ScriptReference/10_reference.Classes.html"

(Nokogiri::HTML.parse(open(REFERENCE_ROOT))/"div.scriprefmain ul li a").inject(Set.new) {|ret, e|
  ret << e.inner_text
}.sort.each {|w| puts w }


