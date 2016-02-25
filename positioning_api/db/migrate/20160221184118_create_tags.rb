class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, null: false
      t.string :tag, null: false

      t.timestamps null: false
    end
  end
end
