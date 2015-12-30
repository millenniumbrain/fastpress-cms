Sequel.migration do
  up do
    create_table(:permissions_groups) do
      primary_key :id
      foreign_key :permission_id
      foreign_key :group_id
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:permissions_groups)
  end
end
