class CreateApikeyDashboardKeys < ActiveRecord::Migration
  def change
    create_table :apikey_dashboard_keys do |t|
      t.references :user
      t.string :application, limit: 25, null: false
      t.string :api_key, limit: 50, null: false
      t.timestamps null: false
    end
  end
end
