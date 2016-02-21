class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :position
      t.references :tag
      t.references :creator

      t.string :item, null: false
      t.string :note
      t.string :datetime

      t.timestamps null: false
    end
  end
end
