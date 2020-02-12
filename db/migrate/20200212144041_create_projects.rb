class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :max_revisions
      t.integer :project_manager_id
      t.integer :client_id
      t.string :status
      t.timestamps
    end
  end
end
