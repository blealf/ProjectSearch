class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interest_name

      t.timestamps null: false
    end
  end
end
