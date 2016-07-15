#
# The Project Class is the model interfaces directly with the database table projects
# This communicates with the projects controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
#

class Project < ActiveRecord::Base
	


	# This models the associations
	#
	# Each projects belongs to one staff
	belongs_to :staff
	#
	#each project belongs to one categeory
	belongs_to :category
	#
	# a project can belong to several courses and vice versa
	has_and_belongs_to_many :courses


	# ==============================================================
	#orderrs the project by date
	# =============================================================
	default_scope -> { order(created_at: :desc) }

	# validates the presence of specific fields of the projects
	validates :title, :description, :tags, :staff_id, :category, presence: true


	# this uses the solr sunspot gem to define the fields that would be searcheable
	# and indexes them
	searchable do

		# The fields of the projects are defined first with the title having a high boost
		# followed by the tags
		text :title, :boost => 5
		text :description
		text :tags, :boost => 2

		# ================================================
		# text :staff, :stored => true do
		# 	# staff.first_name
		# 	# staff.last_name
		# end
		#
		# {, :stored => true do } for fields to be hignlighted
		# ================================================

		# the staff first_name and last_name are indexed for use in search
		text :staff_first_name do
			 staff.first_name
		end

		text :staff_last_name do
			 staff.last_name
		end

		# the category names are also indexed for search
		string :category  do
			category.category_name
		end
		#join(:firstname, :target => Staff, :type => :string, :join => {:from => :staff_id, :to => :id})

		# the course names are indexed for search
		text :courses do
			courses.map{|course| course.course_name}
		end


		# facets
		# These variables are used for the facet
		string :fullname
		string :categoryname

		# this defines a coursename variable
		# the multiple indicates that a projects 
		# has and belongs to multiple courses
		string :coursename, :multiple => true do
			courses.map{|course| course.course_name}
		end
	end

	# private methods for this class
	private

		# this method defines the staff first_name  and last_name 
		# which is used for the filter
		def fullname
			staff.first_name + " " + staff.last_name
		end

		def categoryname
			category.category_name
		end
	
end
