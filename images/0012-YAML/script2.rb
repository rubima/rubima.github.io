## Kwalify::Parse ��Ȥä� YAML �ɥ�����Ȥ��ɤ߹��ࡣ
## (���Υѡ����Ϲ��ֹ���ݻ����Ƥ��롣)
str = ARGF.read()
{{*parser = Kwalify::Parser.new(str)*}}
{{*document = parser.parse()*}}

## �������ޥե�������ɤ߹��� (����� Syck ��ȤäƤ�褤)��
## �Х�ǡ�����������Ƹ��ڤ��롣
schema = YAML.load_file('schema.yaml')
{{*validator = Kwalify::Validator.new(schema)*}}
{{*errors = validator.validate(document)*}}

## ���顼������С����ֹ�����ꤷ��ɽ�����롣
## ���ֹ�����ꤹ��ˤϡ�Kwalify::Parser ��ɬ�ס�
if !errors || errors.empty?
  puts "valid."
else
  {{*parser.set_errors_linenum(errors)*}}        # YPath ���Ȥ˹��ֹ������
  errors.sort.each do |err|                # ���ֹ�ǥ����Ȥ���ɽ������
    print "line %d: path %s: %s" % [err.linenum, err.path, err.message]
  end
end
