=begin
=dcl_contour.rb: �������ƐF�h��̃T���v��
�g�p�@
 % ruby dcl_contour.rb [-ps] [-dump]
����
 * ���c�� �쐬 (�u�����炭DCL�v�f���v���O����������)
 * �x�V�� ���� 2005/04
=end

require "numru/dcl"
include NumRu
include NMath

nt = 50
nz = 50
tmin, tmax = 0.0, 5.0
zmin, zmax = 20.0,50.0

t = NArray.sfloat(nt+1,    1).indgen! * (tmax-tmin)/nt    # ����
z = NArray.sfloat(   1, nz+1).indgen! * (zmax-zmin)/nz    # �c��

uz = exp(-0.2*z)*sqrt(z)
tz = -2.0*exp(-0.1*z)
u = uz*sin(3.0*(tz+t))               # (nt+1,nz+1)�̔z��ɂȂ�B

if ARGV.index("-ps")
  # �R�}���h���C���I�v�V������-ps���܂܂�Ă����PS�t�@�C�������
  DCL::gropn(2)     # Windows �ł� 3 �ɂ��邱��
else
  # �E�B���h�E���J��
  DCL::swpset('iheight',700)           # ��ʂ̏c�����̃s�N�Z�����w��
  DCL::swpset('iwidth',700)            # ��ʂ̉������̃s�N�Z�����w��
  DCL::gropn(1)     
  DCL::swpset('ldump', true) if ARGV.index("-dump")   # ��ʂ̃_���v
end

DCL::grfrm
DCL::grswnd(tmin, tmax, zmin, zmax)         # ���E�E�E���E��̍��W�l
DCL::uspfit                                 # ���Ƃ͂��܂���
DCL::grstrf                                 # ���W�̊m��

DCL::ussttl('TIME', 'YEAR', 'HEIGHT', 'km') # ���̃^�C�g���ƒP�ʂ̐ݒ�
DCL::uelset("ltone",true)                   # �F���ɂ���
DCL::uetone(u)                              # �ʂ�킯
DCL::usdaxs                                 # ���W����`��
DCL::udcntr(u)                              # ���l�����Ђ�
DCL::uxmttl('t','Idealized QBO',0.0)        # title. top �ɒ�������(0.0)

DCL::grcls
