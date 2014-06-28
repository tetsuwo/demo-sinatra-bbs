require "sequel"
Sequel::Model.plugin(:schema)

Sequel.connect("sqlite://comments.db")

class Comments < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      string :name
      string :title
      text :message
      timestamp :posted_date
    end
    create_table
  end
end
