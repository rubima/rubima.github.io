class MyShip
  attr_accessor :x, :y, :collision, :delta_x, :delete

  # �摜�ǂݍ��݂Ɖe�摜����
  @@image0 = Image.loadToArray("image/myship.png", 4, 1)
  @@image1 = Array.new(4) {Image.new(32, 32)}
  black = [128, 0, 0, 0]
  for i in 0..3
    for y in 0..31
      for x in 0..31
        # ���摜�œ�������Ȃ����������ɂ���
        @@image1[i][x, y] = black if @@image0[i][x, y][0] != 0
      end
    end
  end

  # �V���b�g������
  f = 4000
  @@sound = SoundEffect.new(20, WAVE_TRI) do   # 20ms �̎O�p�g�𐶐�����
    f = f - 120      # ���g���� 4000Hz ���� 1ms ���Ƃ� 120Hz ������
    [f, 15]          # [ ���g��, ���� ] �̔z���Ԃ�
  end

  # ����������
  def initialize
    @x = 140          # x ���W
    @y = 400          # y ���W
    @oldx = 140       # �O�t���[����x���W
    @delete = false   # ���@���������Ƃ��� true
    @animecount = 0   # �A�j���[�V�����p�J�E���g
    @collision = CollisionBox.new(nil, 4, 4, 27, 27)  # �Փ˔���I�u�W�F�N�g
  end

  def update
    # �ړ�
    dx = Input.x * 2.4
    dy = Input.y * 3
    if Input.x != 0 and Input.y != 0   # �i�i���̎��� 0.7 �{
      dx *= 0.7
      dy *= 0.7
    end
    @x += dx
    @y += dy

    # ��ʒ[�̔���
    @x = 0 if @x < 0
    @x = 360 - 32 if @x > 360 - 32
    @y = 0 if @y < 0
    @y = 480 - 32 if @y > 480 - 32

    # �Փ˔���͈͂̈ړ�
    @collision.set(@x, @y)

    # �V���b�g
    if Input.padPush?(P_BUTTON0)
      ObjectGroup.push(MyShot.new(@x - 18, @y - 32, 270))
      ObjectGroup.push(MyShot.new(@x + 18, @y - 32, 270))
      ObjectGroup.push(MyShot.new(@x + 32, @y - 16, 300))
      ObjectGroup.push(MyShot.new(@x - 32, @y - 16, 240))
      @@sound.play
    end

    # �w�i��G�Ȃǂ̉��␳�l�v�Z
    @delta_x = -((@x - @oldx) / 5)
    @oldx = @x

    # �A�j���[�V�����p�J�E���g
    @animecount += 1
    @animecount -= 80 if @animecount >= 80
  end

  # �`��
  def draw
    Window.draw(@x, @y, @@image0[@animecount / 20], 15)           # ���@
    Window.draw(@x - 16, @y - 16, @@image1[@animecount / 20], 1)  # �e
  end
end