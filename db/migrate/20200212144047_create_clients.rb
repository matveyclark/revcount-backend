class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.boolean :is_client, :default => true
      t.integer :user_id
      t.timestamps
    end
  end
end
