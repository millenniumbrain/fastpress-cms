Sequel.migration do
  up do
    create_table(:tags) do
      primary_key :id
      String :name, :null => false
      DateTime :updated_at
      DateTime :created_at
    end
  end

  down do
    drop_table(:tags)
  end
end
