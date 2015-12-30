class Post < Sequel::Model(:posts)
  many_to_one :user
  many_to_many :tags
end
