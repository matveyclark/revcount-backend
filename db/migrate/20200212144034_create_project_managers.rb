class CreateProjectManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_managers do |t|
      t.boolean :is_pm, :default => true
      t.integer :user_id
      t.timestamps
    end
  end
end
