Sequel.migration do
  up do
    create_table(:posts) do
      primary_key :id
      String :title, :null => false
      String :subtitle
      String :body, :text => true
      FalseClass :draft, :default => false
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:posts)
  end
end
