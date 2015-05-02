class AddFitbitkeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fitkey, :string
  end
end
