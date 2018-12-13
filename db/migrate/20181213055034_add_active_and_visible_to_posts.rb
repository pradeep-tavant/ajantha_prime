class AddActiveAndVisibleToPosts < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.boolean :active, default: true
      t.boolean :visible, default: false
    end
  end
end
