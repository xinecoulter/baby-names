class CreateBabynamesTable < ActiveRecord::Migration
  def up
    create_table :babynames do |t|
      t.string :name
      t.integer :birth_year
      t.string :gender
      t.integer :frequency
      t.references :state
      t.timestamps
    end
  end

  def down
    drop_table :babynames
  end
end
