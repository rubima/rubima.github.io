## �᥿�Х�ǡ������������
require 'kwalify'
{{*meta_validator = Kwalify::MetaValidator.instance()*}}

## �������ޥե�����򸡾ڤ���
schema = File.load_file('schema.yaml')
{{*errors = meta_validator.validate(schema)*}}
if !errors || errors.empty?
  puts "valid."
else
  errors.each do |error|
    puts "- [#{error.path}] #{error.message}"
  end
end
