class AddProjectNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :project_name, :string
  end
end
