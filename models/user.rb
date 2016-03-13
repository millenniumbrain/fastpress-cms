class User < Sequel::Model(:users)
  include BCrypt
  many_to_one :group
  one_to_many :posts

  def self.login(username, password)
    return unless username && password
    return unless user = filter(:name => username).first
    return unless BCrypt::Password.new(user.password_hash) == password
    true
  end

  def self.password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def demote
    new_group_id = self.group_id + 1
    self.update(:group_id => new_group_id) unless Group.all.length < new_group_id
  end

  def demote_to(group)
    user_group = Group.filter(:name => group.downcase).first
    new_group_id = user_group.id
    self.update(:group_id => new_group_id)
  end

  def promote
    new_group_id = self.group_id - 1 unless self.group_id == 1
    self.update(:group_id => new_group_id)
  end

  def promote_to(group)
    user_group = Group.filter(:name => group.downcase).first
    new_group_id = user_group.id
    self.update(:group_id => new_group_id)
  end
end
