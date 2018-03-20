class MyEruby5
  def self.desc; "inline method"; end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename)
    return convert(File.read(filename))
  end

  ## Ruby�ץ������Ѵ�����
  def convert(input)
    s = '_buf = ""; '
    pos = 0
    input.scan(/<%(=)?(.*?)%>/m) do
      equal, code = $1, $2
      match = Regexp.last_match
      len   = match.begin(0) - pos
      text  = input[pos, len]
      pos   = match.end(0)
      text.gsub!(/['\\]/, '\\\\\&')        # �ƥ�����
      s << "_buf << '#{text}'; " unless text.empty?
      if equal
        s << "_buf << (#{code}).to_s; "    # �����߼�
      else
        s << "#{code}; "                   # ������ʸ
      end
    end
    text = $' || input                     # �Ĥ�Υƥ�����
    text.gsub!(/['\\]/, '\\\\\&')
    s << "_buf << '#{text}'; " unless text.empty?
    s << "_buf\n"
    return s
  end

end
