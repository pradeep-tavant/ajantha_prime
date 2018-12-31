class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :member, foreign_key: true
      t.references :vote_option, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:vote_option_id, :member_id], unique: true
  end
end
