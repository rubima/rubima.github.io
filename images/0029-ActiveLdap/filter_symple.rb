# "(uid=ruby_taro)" �̕ʕ\��
User.find :first, :filter => [:uid, 'ruby_taro']

# "(|(uid=ruby_taro)(uid=ruby_hanako))" �̕ʕ\��
User.find :all, :filter => [:or, {:uid => ['ruby_taro', 'ruby_hanako']}]
