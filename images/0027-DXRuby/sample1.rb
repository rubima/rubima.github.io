require 'dxruby'

x = 0                               # x���W�̕ϐ�
y = 0                               # y���W�̕ϐ�
image = Image.load('data.png')      # data.png��ǂݍ��� (1)

Window.loop do                      # ���C�����[�v (2)
  x = x + Input.x                   # �������̓��͂�x���W��ύX (3)
  y = y + Input.y                   # �c�����̓��͂�y���W��ύX

  Window.draw(x, y, image)          # data.png�����W�̈ʒu�ɕ\�� (4)

  break if Input.keyPush?(K_ESCAPE) # Esc�L�[�ŏI�� (5)
end
