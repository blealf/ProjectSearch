class CreateShortlists < ActiveRecord::Migration[4.2]
  def change
    create_table :shortlists do |t|

      t.timestamps null: false
    end
  end
end
