#!/usr/bin/ruby

require "cgi "

print "Content-Type: text/plain\n\n"

cgi = CGI.new
m = cgi["msg"]

print m
