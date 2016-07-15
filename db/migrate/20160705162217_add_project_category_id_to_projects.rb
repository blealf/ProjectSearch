class AddProjectCategoryIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :product_category, index: true, foreign_key: true
  end
end
