class CreateOps < ActiveRecord::Migration
  def change
    create_table :ops do |t|
      t.references :position
      t.references :user

      t.string :item, null: false
      t.string :note
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
