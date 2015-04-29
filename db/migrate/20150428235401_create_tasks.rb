class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, presence: true
      t.string :title, presence: true
      t.string :description, presence: true
      t.integer :value, presence: true
      t.string :category, presence: true
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
