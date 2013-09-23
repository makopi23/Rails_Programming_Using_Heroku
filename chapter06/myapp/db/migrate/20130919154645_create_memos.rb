class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.integer :sample_id
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
