Sequel.migration do
  up do
    create_table(:tags_posts) do
      primary_key :id
      foreign_key :tag_id
      foreign_key :post_id
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:tags_posts)
  end
end
