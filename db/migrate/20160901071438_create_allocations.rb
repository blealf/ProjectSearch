class CreateAllocations < ActiveRecord::Migration[4.2]
  def change
    create_table :allocations do |t|
      t.references :student, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.references :supervision_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
