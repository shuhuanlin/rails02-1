class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.ineger :topic_id

      t.timestamps
    end
  end
end
