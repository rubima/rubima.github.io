#!/usr/bin/env ruby

require 'kwalify'
require 'yaml'

## Kwalify::Validator �Υ��֥��饹�����
class AnswersValidator < Kwalify::Validator

  ## ��������������ɤ߹���
  @@schema = YAML.load_file('answers.schema.yaml')

  def initialize()
    super(@@schema)
  end

  ## Validator#validate() ����ƤӽФ����եå��᥽�å�
  def {{*validate_hook(value, rule, path, errors)*}}
    # �롼���̾���� 'Answer' �Ǥ���������¹�
    case {{*rule.name*}}
    when {{*'Answer'*}}
      # ������ 'bad' �Ǥ���С���ͳ�ε�����ɬ�ܤǤ���
      if value['answer'] == 'bad'
        if value['reason'] == nil || value['reason'].empty?
          msg = "reason is required when answer is 'bad'."
          {{*errors << Kwalify::ValidationError.new(msg, path)*}}
        end
      end
    end
  end

end


## YAML �ɥ�����Ȥ��ɤ߹���
## (���顼���ֹ��ɽ�����뤿��ˡ�Kwalify::YamlParser ��Ȥ���)
input = ARGF.read()
parser = Kwalify::YamlParser.new(input)
document = parser.parse()

## �Х�ǡ���������������ڤ���
validator = AnswersValidator.new
errors = validator.validate(document)

## ���顼������й��ֹ�Ĥ���ɽ������
if !errors || errors.empty?
  puts "Valid."
else
  parser.set_errors_linenum(errors)
  errors.sort.each do |error|
    puts " - line #{error.linenum}: [#{error.path}] #{error.message}"
  end
end
