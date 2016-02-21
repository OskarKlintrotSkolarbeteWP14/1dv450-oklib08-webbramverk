class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :first_name, limit: 20
      t.string :last_name, limit: 30
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
