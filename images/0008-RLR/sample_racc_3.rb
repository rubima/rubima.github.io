require 'abnf'
require 'sample_racc_1'
fmt = <<EOS
  expr  = prim 0*(op prim)
  prim  = ["("] num [")"]
  num   = 1*("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")
  op    = "+" | "-" | "*" | "/"
EOS
reg = ABNF.regexp(fmt)
str = "3+(2-1)��4�ł��B33(23)��33��(23)�ɋ�ʂ���܂��B"
calc = Calc.new()
puts( str.gsub(reg){|expr| calc.parse(expr)} )
