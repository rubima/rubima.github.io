# "(uid=ruby_taro)" �����p�����
User.find :all, :filter => [:uid, 'ruby_taro']

# "(uidNumber>=100)" �����p�����
User.find :all, :filter => [:uidNumber, '>=', 100]
