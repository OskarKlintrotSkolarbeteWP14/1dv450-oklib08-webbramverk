class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, limit: 255, null: false
      t.string :password_digest, null: false
      t.string :first_name, limit: 20
      t.string :last_name, limit: 30
      t.timestamps null: false
    end
  end
end
