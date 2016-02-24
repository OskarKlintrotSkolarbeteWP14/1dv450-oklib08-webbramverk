class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :lng, null: false
      t.string :lat, null: false
      t.string :place, null: false
      t.string :region, null: false
      t.string :country, null: false

      t.timestamps null: false
    end
  end
end
