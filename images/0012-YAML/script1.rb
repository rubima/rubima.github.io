require 'kwalify'

## �������ޥե�������ɤ߹��ߡ��Х�ǡ�����������롣
## ������������˥��顼������ȡ��㳰 Kwalify::SchemaError ��ȯ�����롣
schema = YAML.load_file('schema.yaml')
{{*validator = Kwalify::Validator.new(schema)*}}

## YAML �ɥ�����Ȥ��ɤ߹��ߡ��Х�ǡ����Ǹ��ڤ��롣
## ���顼������� Kwalify::ValidationError �����󤬡��ʤ���ж��������֤���롣
document = YAML.load_file('document.yaml')
{{*errors = validator.validate(document)*}}
if !errors || errors.empty?
  puts "valid."
else
  errors.each do |error|
    puts "[#{error.path}] #{error.message}"
  end
end
