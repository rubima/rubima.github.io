puts '����񂯂�Q�[���J�n'
sleep 1

# �v���C���[�̂���񂯂����
puts '�����o���܂����H'
puts '1 �O�['
puts '2 �`���L'
puts '3 �p�['
input_value = gets

# ����񂯂񃍃{�b�g�̏���
robo = rand(3) + 1
case robo
when 1
  puts '���{�b�g�̓O�[���o�����I'
when 2
  puts '���{�b�g�̓`���L���o�����I'
when 3
  puts '���{�b�g�̓p�[���o�����I'
end

# ����񂯂񌋉ʔ���
player = input_value.to_i
case player
when 1
  puts '���Ȃ��̓O�[���o�����I'
  case robo
  when 1 # ���{�b�g���O�[�Ȃ�
    puts '���������ł�'
  when 2 # ���{�b�g���`���L�Ȃ�
    puts '���Ȃ��̏����ł�'
  when 3 # ���{�b�g���p�[�Ȃ�
    puts '���Ȃ��̕����ł�'
  end
when 2
  puts '���Ȃ��̓`���L���o�����I'
  case robo
  when 1 # �O�[
    puts '���Ȃ��̕����ł�'
  when 2 # �`���L
    puts '���������ł�'
  when 3 # �p�[
    puts '���Ȃ��̏����ł�'
  end
when 3
  puts '���Ȃ��̓p�[���o�����I'
  case robo
  when 1 # �O�[
    puts '���Ȃ��̏����ł�'
  when 2 # �`���L
    puts '���Ȃ��̕����ł�'
  when 3 # �p�[
    puts '���������ł�'
  end
else # �ǂ� when �̏������������Ȃ������Ƃ�
  puts '���Ȃ��͉����o���Ȃ������I'
  puts '���Ȃ��̕����ł�'
end
