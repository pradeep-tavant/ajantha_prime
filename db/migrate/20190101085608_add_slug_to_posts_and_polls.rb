class AddSlugToPostsAndPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :slug, :string, null: false
    add_index :posts, :slug, unique: true

    add_column :polls, :active, :boolean, default: true
    add_column :polls, :start_date, :date
    add_column :polls, :end_date, :date
    add_column :polls, :slug, :string, null: false
    add_index :polls, :slug, unique: true
  end
end
