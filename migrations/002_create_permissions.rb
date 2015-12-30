Sequel.migration do
  up do
    create_table(:permissions) do
      primary_key :id
      String :description, :null => false
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:permissions)
  end
end
