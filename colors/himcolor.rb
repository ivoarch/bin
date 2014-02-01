#!/usr/bin/env ruby
# coding: utf-8
# ANSI color scheme script
# Original: http://crunchbanglinux.org/forums/post/128584/#p128584
# Modified by Ivo in (Ruby)

0.upto(6).each do |f|
  print "\033[#{f+41}m\033[#{f+30}m██▓▒░"
end
  puts "\033[37m██"
  puts "\n"

0.upto(6).each do |f|
  print "\033[#{f+41}m\033[1;#{f+30}m██▓▒░"
end
  puts "\033[1;37m██"
  puts "\033[0m"
