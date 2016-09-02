class CreateUserIdToEmergencies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_id_to_emergencies do |t|
    	add_column :emergencies, :user_id, :integer
    end

    add_index :emergencies, :user_id
  end
end
