def f1()
  f2()
end

def f2()
  f3()
end

def f3()
  foobar    # NameError ��O������
end

f1()