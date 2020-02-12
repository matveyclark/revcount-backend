class CreateProjectManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :company_name
      t.timestamps
    end
  end
end
