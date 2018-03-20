# �ڑ��ݒ�
ActiveLdap::Base.setup_connection :host => "localhost", :base => "o=rubyistMagazine,c=jp"

# �N���X��`
class User < ActiveLdap::Base 
  ldap_mapping :dn_attribute => "cn", :prefix => "ou=Users"
end

# ���[�U�̌���
u = User.find "Ruby Taro" #=> #<User ....>

# �I�u�W�F�N�g�N���X�̎Q��
u.classes                 #=> ["top", "posixAccount"]

# ���� �� getter
u.cn                   #=> "Ruby Taro"

# �����ւ� setter
u.gid_number = 9999       #=> 9999

# �G���g���̕ۑ�
u.save                    #=> true

# �G���g���̍폜
u.destroy                 #=> true
