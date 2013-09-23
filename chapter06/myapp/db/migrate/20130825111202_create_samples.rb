class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :age
      t.string :mail
      t.string :tel

      t.timestamps
    end
  end
end
