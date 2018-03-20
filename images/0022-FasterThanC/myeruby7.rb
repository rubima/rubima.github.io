class MyEruby7
  def self.desc; "interpolation"; end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename)
    return convert(File.read(filename))
  end

  ## Ruby�ץ������Ѵ�����
  def convert(input)
    s = '_buf = ""; '
    pos = 0
    str = ''
    input.scan(/<%(=)?(.*?)%>/m) do
      equal, code = $1, $2
      match = Regexp.last_match
      len   = match.begin(0) - pos
      text  = input[pos, len]
      pos   = match.end(0)
      text.gsub!(/[`\\]/, '\\\\\&')             # �ƥ�����
      str << text
      if equal
        str << "\#{" << code << "}"             # �����߼�
      else
        s << "_buf << %Q`#{str}`; " unless str.empty?
        str = ''
        s << "#{code}; "                        # ������ʸ
      end
    end
    text = $' || input                          # �Ĥ�Υƥ�����
    text.gsub!(/[`\\]/, '\\\\\&')
    str << text
    s << "_buf << %Q`#{str}`; " unless str.empty?
    s << "_buf\n"
    return s
  end

end
