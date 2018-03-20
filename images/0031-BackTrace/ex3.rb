def debug_puts(message)
  caller()[0] =~ /(.*?):(\d+)/   # �Ăяo�����𒲂ׂ�
  filename, linenum = $1, $2
  $stderr.puts "[DEBUG] #{filename}:#{linenum}"
  $stderr.puts "[DEBUG] #{message}"
end

x = "foo"
debug_puts "x=#{x.inspect}"
x = "bar"
debug_puts "x=#{x.inspect}"