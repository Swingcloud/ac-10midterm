class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
    	t.integer :user_id
    	t.text :comment
    	t.integer :emergency_id
      t.timestamps
    end
  end
end
