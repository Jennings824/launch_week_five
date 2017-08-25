class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
