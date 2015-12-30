Sequel.migration do
  up do
    create_table(:media) do
      primary_key :id
      String :type
      String :url
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:media)
  end
end
