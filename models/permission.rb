class Permission < Sequel::Model(:permissions)
  many_to_many :groups
end
