class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.references :staff, index: true, foreign_key: true
      t.references :project_application, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
