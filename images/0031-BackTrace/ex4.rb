class AssertionError < StandardError
end

def _assert expr
  return if expr
  ex = AssertionError.new("assertion failed")
  ex.set_backtrace(caller())
  raise ex  # �{���͂����ŗ�O���������Ă邯��
end

def main
  _assert 1+1 == 3   # �������������Ŕ�����������
end                  # �悤�ɋU�����Ă���

main()