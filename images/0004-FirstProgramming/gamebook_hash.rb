msg0 = "�R�{�̕����ꓹ������܂��B�ǂ̓���i�݂܂����B\n" +
       "  1 ���̓�\n  2 �^�񒆂̓�\n  3 �E�̓�"
msg1 = "�����I\n���Ƃ����ɗ����Ă��܂��܂����B\n�` GAME " +
       "OVER �`"
msg2 = "�^�񒆂̓����܂����������Ă����Ɓc�c\n�󔠂��݂�" +
       "���܂����I\n  1 ���̂܂܂ɂ��Ă���\n  2 ������"
msg3 = "���΂炭����������Ɓ@���Ƃ̏ꏊ�ɂ��ǂ��Ă��܂�" +
       "�܂����B\n  1 ����"
msg4 = "�󔠂ɂ͌������������@���ƂɋA��܂����B\n�` GAM" +
       "E OVER �`"
msg5 = "�p�J�b\n�܂΂䂢�������ӂꂾ���c�c\n�P�O�O���̋�" +
       "�݂���ɓ���܂����I"

tbl = {
  'opening' => [msg0, 'left', 'center', 'right'],
  'left'    => [msg1],
  'center'  => [msg2, 'leave', 'ending'],
  'right'   => [msg3, 'opening'],
  'leave'   => [msg4],
  'ending'  => [msg5],
}

scene = 'opening'
while true
  scene_data = tbl[scene]
  message = scene_data[0]
  puts message

  if scene_data[1] == nil
    exit
  end

  print '  ��������͂��Ă������� '
  input_value = gets.to_i

  if input_value > 0
    next_scene = scene_data[input_value]
    if next_scene == nil
      puts '�s���Ȓl�����͂���܂���'
    else
      scene = next_scene
    end
  else
    puts '�s���Ȓl�����͂���܂���'
  end

  sleep 0.5
  print "\n"
end
