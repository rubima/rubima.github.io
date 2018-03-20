class User < ActiveLdap::Base
  ldap_mapping :prefix => "ou=Users",
                :dn_attribute => "uid",
                :classes => ["inetOrgPerson", "posixAccount"]

  def validate
    # uid �����K�\���Ƀ}�b�`���邩�m�F
    if self.uid !~ /\A[a-zA-Z0-9]+\z/
      # uid �ŃG���[���N���������L�^
      errors.add :uid, "must match with '/\\A[a-zA-Z0-9]+\\z/'."
    end
  end
end
