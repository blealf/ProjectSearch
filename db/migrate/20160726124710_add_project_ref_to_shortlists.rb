class AddProjectRefToShortlists < ActiveRecord::Migration[4.2]
  def change
    add_reference :shortlists, :project, index: true, foreign_key: true
  end
end
