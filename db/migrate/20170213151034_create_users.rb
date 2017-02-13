class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t| #t is tabel
      t.column "first_name", :string, :limit => 25
      # shorthand syntax for creating a column with string type
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :nul => false
      t.string "password", :limit => 40

      # rails wll automaticaly update the 'created_at and updated_at' columns
      # t.datetime "created_at"
      # t.datetime "updated_at"

      #shorthand for 'created_at and updated_at' columns
      t.timestamps
    end
  end

  def down
    drop_table :users

  end
end
