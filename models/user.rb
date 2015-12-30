class User < Sequel::Model(:users)
  many_to_one :group
  one_to_many :posts
end
