class Group < Sequel::Model(:groups)
  many_to_many :permissions
  one_to_many :users
end
