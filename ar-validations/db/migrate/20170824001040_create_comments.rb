class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
    end
  end
end
