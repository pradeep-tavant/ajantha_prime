class AddOnDateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :on_date, :date, default: Date.today
  end
end
