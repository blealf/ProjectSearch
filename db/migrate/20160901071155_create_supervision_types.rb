class CreateSupervisionTypes < ActiveRecord::Migration
  def change
    create_table :supervision_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
