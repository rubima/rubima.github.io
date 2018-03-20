Window.caption = "��тܗp DXRuby �T���v���Q�[��" # �E�B���h�E�̃L���v�V�����ݒ�
Window.width = 360        # �E�B���h�E�̉��T�C�Y�ݒ�
Window.height = 480       # �E�B���h�E�̏c�T�C�Y�ݒ�
Input.setRepeat(0, 5)     # �L�[�̃I�[�g���s�[�g�ݒ�B5 �t���[���� 1 �� on

ObjectGroup = []          # �I�u�W�F�N�g�z��
Collision_MyShot = []     # �e�̔���͈͔z��
Collision_Enemy = []      # �G�̔���͈͔z��
Collision_EnemyShot = []  # �G�̒e�̔���͈͔z��

count = 0                 # �G�o�������p�J�E���g
font = Font.new(32)       # �t�H���g����

$myship = MyShip.new      # ���@����
ObjectGroup.push($myship) # ���@���I�u�W�F�N�g�z��ɒǉ�
ObjectGroup.push(Map.new) # �w�i�I�u�W�F�N�g�������I�u�W�F�N�g�z��ɒǉ�

# ���C�����[�v
Window.loop do

  # �G�o������
  count += 1
  if count % 20 == 0      #  20 �J�E���g�� 1 ��
    if count % 400 == 0   # 400 �J�E���g�� 1 ��
      # �G 2 �̃I�u�W�F�N�g�������I�u�W�F�N�g�z��ɒǉ�
      ObjectGroup.push(Enemy2.new(rand(240), -64))
      count = 0
    else
      # �G 1 �̃I�u�W�F�N�g�������I�u�W�F�N�g�z��ɒǉ�
      ObjectGroup.push(Enemy1.new(rand(320), -48))
    end
  end

  # �I�u�W�F�N�g���X�V
  ObjectGroup.each do |obj|
    obj.update
  end

  # �Փ˔���
  Collision.check(Collision_MyShot, Collision_Enemy)      # ���@�V���b�g�ƓG
  Collision.check(Collision_EnemyShot, $myship.collision) # �G�V���b�g�Ǝ��@

  # �Փ˔���z�񏉊���
  Collision_MyShot.clear
  Collision_Enemy.clear
  Collision_EnemyShot.clear

  # �ړ���Փ˔���ŏ������L������z�񂩂�폜
  ObjectGroup.delete_if do |obj|
    obj.delete
  end

  # �I�u�W�F�N�g��`��
  ObjectGroup.each do |obj|
    obj.draw
  end

  # Esc �L�[�ŏI��
  break if Input.keyPush?(K_ESCAPE)

  # �e����o��
  Window.drawFont(0, 0, Window.getLoad.to_i.to_s + " %", font, :z => 100)
  Window.drawFont(0, 32, ObjectGroup.size.to_s + " objects", font, :z => 100)
end