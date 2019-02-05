class AddColumnAssigneeIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :assignee_id, :integer
  end
end
