require 'strscan'
class MyEruby2
  def self.desc; "no split lines"; end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename)
    return convert(File.read(filename))
  end

  ## Ruby�ץ������Ѵ�����
  def convert(input)
    s = '_buf = ""; '
    kind = :text
    input.scan(/(.*?)(<%=?|%>)/m) do # '<%' �� '<%=' �� '%>' ��õ��
      str = $1                       # �ƥ����Ȥޤ���������ʸ�估
      s << _convert_str(str, kind) unless str.empty?
      case $2
      when '<%'  ;  kind = :stmt     # ������ʸ
      when '<%=' ;  kind = :expr     # �����߼�
      when '%>'  ;  kind = :text     # �ƥ�����
      end
    end
    text = $' || input               # �Ĥ�Υƥ�����
    s << _convert_str(text, kind) unless text.empty?
    s << "_buf\n"
    return s
  end

  private

  ## �ƥ����Ȥޤ��������߼���ʸ���Ѵ�����
  def _convert_str(str, kind)
    case kind
    when :stmt ;  ret = str;  ret << "; " if ret[-1] != ?\n
    when :expr ;  ret = "_buf << (#{str}).to_s; "
    when :text ;  str.gsub!(/['\\]/, '\\\\\&')
                  ret = "_buf << '#{str}'; "
    else       ;  raise "*** error: kind=#{kind.inspect}"
    end
    return ret
  end

end
