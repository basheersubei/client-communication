class AddDeadlineToUser < ActiveRecord::Migration
  def change
    add_column :users, :project_deadline, :datetime
  end
end
