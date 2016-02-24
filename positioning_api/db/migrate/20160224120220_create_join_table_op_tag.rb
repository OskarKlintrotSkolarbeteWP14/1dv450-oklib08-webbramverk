class CreateJoinTableOpTag < ActiveRecord::Migration
  def change
    create_join_table :ops, :tags do |t|
      t.index [:op_id, :tag_id]
      t.index [:tag_id, :op_id]
    end
  end
end
