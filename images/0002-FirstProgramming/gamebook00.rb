scene = 'opening'
while true
  case scene
  when 'opening'
    puts '�R�{�̕����ꓹ������܂��B�ǂ̓���i�݂܂����B'
    puts "  1 ���̓�"
    puts "  2 �^�񒆂̓�"
    puts "  3 �E�̓�"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'left'
    when 2
      scene = 'center'
    when 3
      scene = 'right'
    end
  when 'left'
    puts '�����I'
    sleep 1
    puts '���Ƃ����ɗ����Ă��܂��܂����B'
    puts '�` GAME OVER �`'
    exit # �v���O�������I��
  when 'center'
    puts '�^�񒆂̓����܂����������Ă����Ɓc�c'
    sleep 1
    puts '�󔠂��݂��܂����I'
    puts "  1 ���̂܂܂ɂ��Ă���"
    puts "  2 ������"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'leave'
    when 2
      scene = 'ending'
    end
  when 'right'
    puts '���΂炭����������Ɓ@���Ƃ̏ꏊ�ɂ��ǂ��Ă��܂��܂����B'
    sleep 1
    scene = 'opening'
  when 'leave'
    puts '�󔠂ɂ͌������������@���ƂɋA��܂����B'
    puts '�` GAME OVER �`'
    exit # �v���O�������I��
  when 'ending'
    puts '�p�J�b'
    sleep 1
    puts '�܂΂䂢�������ӂꂾ���c�c'
    sleep 1
    puts '�P�O�O���̋��݂���ɓ���܂����I'
    sleep 2
    puts '�` CONGRATULATIONS! �`'
    sleep 2
    puts '    �V�i���I ����'
    sleep 2
    puts '   �v���O���� ����'
    sleep 2
    puts '      �` END �`'
    exit # �v���O�������I��
  end
end
