#!/usr/local/bin/ruby

require 'cgi'

c = CGI.new
message = c["t"]

f = open("bbs.dat", "a") 
f.write(message + "\n")
f.close

print "Content-type: text/html\n\n"

print <<EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html lang="ja">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
  <title>form</title>
</head>
<body>

�������݂��肪�Ƃ��������܂����B
<a href="bbs.rb">��s�f����</a>

</body>
</html>
EOF
