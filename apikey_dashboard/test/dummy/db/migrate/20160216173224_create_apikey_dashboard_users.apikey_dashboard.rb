# This migration comes from apikey_dashboard (originally 20160216163632)
class CreateApikeyDashboardUsers < ActiveRecord::Migration
  def change
    create_table :apikey_dashboard_users do |t|
      t.string :email, limit: 255, null: false
      t.string :password_digest, null: false
      t.string :first_name, limit: 20
      t.string :last_name, limit: 30
      t.boolean :admin, null: false
      t.timestamps null: false
    end
  end
end
