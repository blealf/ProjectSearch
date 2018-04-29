class AddProjectRefToShortlists < ActiveRecord::Migration
  def change
    add_reference :shortlists, :project, index: true, foreign_key: true
  end
end
