class CreateHelps < ActiveRecord::Migration[4.2]
  def change
    create_table :helps do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
