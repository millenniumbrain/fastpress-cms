Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :email, :null => false
      String :name
      String :password_hash, :null => false
      TrueClass :verified, :default => false
      DateTime :created_at
      DateTime :updated_at
      foreign_key :group_id
    end
  end

  down do
    drop_table(:users)
  end
end
