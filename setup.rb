require './models'

admin = DB[:groups].insert(:name => 'Admin')
editor = DB[:groups].insert(:name => 'Editor')
author = DB[:groups].insert(:name => 'Author')
user = DB[:groups].insert(:name => 'User')
