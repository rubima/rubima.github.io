class MyEruby3
  def self.desc; "pattern matching"; end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename)
    return convert(File.read(filename))
  end

  ## Ruby�ץ������Ѵ�����
  def convert(input)
    s = '_buf = ""; '
    input.scan(/(.*?)<%(=?)(.*?)%>/m) do
      text, equal, code = $1, $2, $3
      s << _convert_str(text, :text) unless text.empty?  # �ƥ�����
      if equal == '='
        s << _convert_str(code, :expr)  # �����߼�
      else
        s << _convert_str(code, :stmt)  # ������ʸ
      end
    end
    text = $' || input                  # �Ĥ�Υƥ�����
    s << _convert_str(text, :text) unless text.empty?
    s << "_buf\n"
    return s
  end

  private

  ## �ƥ����Ȥޤ��������߼���ʸ���Ѵ�����
  def _convert_str(text, kind)
    case kind
    when :stmt ;  ret = text;  ret << "; " if ret[-1] != ?\n
    when :expr ;  ret = "_buf << (#{text}).to_s; "
    when :text ;  text.gsub!(/['\\]/, '\\\\\&')
                  ret = "_buf << '#{text}'; "
    else       ;  raise "*** error: kind=#{kind.inspect}"
    end
    return ret
  end

end
