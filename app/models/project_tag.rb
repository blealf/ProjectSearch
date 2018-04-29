class ProjectTag < ActiveRecord::Base

	# relationship 
	# project tags has many projects and vice-versa
	has_and_belongs_to_many :projects

	# project tags has many students (students choose from them as interests)
	has_and_belongs_to_many :students

	# validates the presence of tag_name
	validates :tag_name, :presence => true
end
