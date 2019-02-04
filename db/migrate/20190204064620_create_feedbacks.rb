class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :member
      t.string :subject
      t.text :content
      t.integer :status, default: 0
      t.integer :priority, default: 0
      t.text :response
      t.timestamps
    end
  end
end
