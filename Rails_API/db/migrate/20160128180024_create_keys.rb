class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.references :user
      t.string :application, limit: 25, null: false
      t.string :api_key, limit: 50, null: false
      t.timestamps null: false
    end
  end
end
