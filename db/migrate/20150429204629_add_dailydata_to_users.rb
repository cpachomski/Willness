class AddDailydataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dailydata, :json, default: {}
  end
end
