class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration[5.1]
  def self.up
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :title
      t.text :body
      t.string :subject
      t.belongs_to :member
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :comments
  end
end
