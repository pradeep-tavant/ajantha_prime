class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :private, default: true
      t.belongs_to :member
      t.timestamps
    end
  end
end
