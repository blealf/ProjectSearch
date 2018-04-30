class CreateLevels < ActiveRecord::Migration[4.2]
  def change
    create_table :levels do |t|
      t.string :level_name

      t.timestamps null: false
    end
  end
end
