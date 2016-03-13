require 'rspec/core'
require 'rspec/expectations'

describe Group do

  let!(:admin) { Group.create(:name => 'admin') }
  let!(:create_users) { Permission.new(:description => 'create users') }

  context 'when associations are correct' do
    it 'has associations' do
      expect(admin.users).to eq []
      expect(admin.permissions).to eq []
    end
  end

  context 'when admins are given permissions' do
    it 'allows for admins to promote users' do
      admin.add_permission(create_users)
      expect(admin.permissions[0][:description]).to eq 'create users'
    end
  end
end

describe User do

  let!(:admin_group)   { Group.create(:name => 'admin') }
  let!(:editor_group)  { Group.create(:name => 'editor') }
  let!(:author_group)  { Group.create(:name => 'author') }
  let!(:moderator_group)  { Group.create(:name => 'moderator') }
  let!(:user_group)    { Group.create(:name => 'user') }


  let(:user) do
    user = User.new do |u|
      u.email = 'test@example.com'
      u.name = 'User'
      u.password = 'test'
      u.group_id = user_group.id
    end
    user.save
  end

  context 'when associations are correct' do
    it 'has associations' do
      expect(user.posts).to eq []
      expect(user.group.class).to eq Group
    end
  end

  describe '#promote' do
    context 'when a user is promoted' do
      it 'has been promoted one group level' do
        user.promote
        expect(user.group_id).to eq moderator_group.id
      end
    end
  end

  describe '#promote_to' do
    context 'when an author is promoted to admin' do
      it 'has become an admin group member' do
        user.promote_to('admin')
        expect(user.group_id).to eq admin_group.id
      end
    end
  end

end
