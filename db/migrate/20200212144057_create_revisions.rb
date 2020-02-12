class CreateRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :revisions do |t|
      t.integer :project_id
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
