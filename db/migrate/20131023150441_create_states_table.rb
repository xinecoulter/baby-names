class CreateStatesTable < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :state_abbreviation
      t.timestamps
    end
  end

  def down
    drop_table :states
  end
end
