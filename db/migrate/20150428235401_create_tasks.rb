class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, presence: true
      t.string :title, presence: true
      t.string :description, presence: true
      t.integer :value, presence: true
      t.string :type, presence: true
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
