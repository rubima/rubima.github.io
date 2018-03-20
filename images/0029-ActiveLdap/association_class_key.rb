class Group < ActiveLdap::Base
  ldap_mapping :prefix => "ou=Groups",
                :dn_attribute => "cn", :classes => ["posixGroup"]

  # User �N���X�𒼐ڎw�肵�Ă���
  has_many :members, :wrap => "memberUid",
                    :class => User, :primary_key => "uid"�@
end
