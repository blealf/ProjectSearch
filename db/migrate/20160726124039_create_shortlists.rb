class CreateShortlists < ActiveRecord::Migration
  def change
    create_table :shortlists do |t|

      t.timestamps null: false
    end
  end
end
