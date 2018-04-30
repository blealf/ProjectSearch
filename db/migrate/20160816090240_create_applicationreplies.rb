class CreateApplicationreplies < ActiveRecord::Migration[4.2]
  def change
    create_table :applicationreplies do |t|
      
      t.references :project_application, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
