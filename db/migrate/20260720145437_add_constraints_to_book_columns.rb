class AddConstraintsToBookColumns < ActiveRecord::Migration[8.1]
  def up
    change_column_null :books, :title, false
    change_column :books, :title, :string, limit: 255

    change_column_null :books, :author_name, false
    change_column :books, :author_name, :string, limit: 255

    change_column_null :books, :read, false
  end

  def down
    change_column_null :books, :title, true
    change_column :books, :title, :string, limit: nil

    change_column_null :books, :author_name, true
    change_column :books, :author_name, :string, limit: nil

    change_column_null :books, :read, true
  end
end
