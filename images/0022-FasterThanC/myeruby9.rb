class MyEruby9
  def self.desc; "define method"; end

  ## �¹��ѤΥ᥽�åɤ��������
  def define_method(body, args=[])
    eval "def self.evaluate(#{args.join(',')}); #{body}; end"
  end

  ## �ե�������ɤ߹����Ruby�ץ������Ѵ�����
  def convert_file(filename, cache_filename=nil)
    cache_filename ||= filename + '.cache'
    if File.file?(cache_filename) && \
       File.mtime(filename) <= File.mtime(cache_filename)
      prog = File.read(cache_filename)
    else
      prog = convert(File.read(filename))
      File.open(cache_filename, 'w') do |f|
        f.flock(File::LOCK_EX)
        f.write(prog)
      end
    end
    return prog
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
      _escape_text(str, text)                   # �ƥ�����
      if equal
        str << "\#{" << code << "}"             # �����߼�
      else
        s << "_buf << %Q`#{str}`; " unless str.empty?
        str = ''
        s << "#{code}; "                        # ������ʸ
      end
    end
    text = $' || input                          # �Ĥ�Υƥ�����
    _escape_text(str, text)
    s << "_buf << %Q`#{str}`; " unless str.empty?
    s << "_buf\n"
    return s
  end

  private

  def _escape_text(str, text)
    text.gsub!(/[`\\]/, '\\\\\&')
    str << text
  end

end
