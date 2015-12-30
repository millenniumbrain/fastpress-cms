class Tag < Sequel::Model(:tags)
  many_to_many :posts
end
