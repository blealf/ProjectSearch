class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.string :url
      #t.references :staff, foriegn_key: true
      #t.index :title
      #t.index :tags
      t.timestamps null: false
    end
    #add_index :projects, [:staff_id, :created_at]
    #add_reference :projects, :staff, index: true, foreign_key: true
  end
end
