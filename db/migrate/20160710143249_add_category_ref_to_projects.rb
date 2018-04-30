class AddCategoryRefToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :category, index: true, foreign_key: true
  end
end
