hash = {}
hash[:ou] = 'rubyistMagazine'
hash[:sn] = 'Ruby'

# "(&(ou=rubyistMagazine)(sn=Ruby))" �����p�����
User.find :all, :filter => [:and, hash] 
