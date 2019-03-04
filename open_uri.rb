require 'open-uri'

open("https://docs.ruby-lang.org/ja/2.5.0/doc/index.html") { |f|
  f.each_line {|line| p line}
}