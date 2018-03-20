class MyEruby6
  def self.desc; "array buffer"; end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename)
    return convert(File.read(filename))
  end

  ## Ruby�ץ������Ѵ�����
  def convert(input)
    s = '_buf = []; '
    pos = 0
    args = []
    input.scan(/<%(=)?(.*?)%>/m) do
      equal, code = $1, $2
      match = Regexp.last_match
      len   = match.begin(0) - pos
      text  = input[pos, len]
      pos   = match.end(0)
      text.gsub!(/['\\]/, '\\\\\&')          # �ƥ�����
      args << "'#{text}'"
      if equal
        args << code                         # �����߼�
      else
	s << "_buf.push(#{args.join(', ')}); " unless args.empty?
	args = []
        s << code << "; "                    # ������ʸ
      end
    end
    text = $' || input                       # �Ĥ�Υƥ�����
    text.gsub!(/['\\]/, '\\\\\&')
    args << "'#{text}'"
    s << "_buf.push(#{args.join(', ')}); " unless args.empty?
    s << "_buf.join\n"
    return s
  end

end
