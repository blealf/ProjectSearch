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

	#each project belongs to one level
	belongs_to :level
	
	#each project belongs to one categeory
	belongs_to :category
	
	# a project can belong to several courses and vice versa
	has_and_belongs_to_many :courses

	# a project can belong to several project_tags and vice versa
	has_and_belongs_to_many :project_tags

	# a student shortlists many projects 
	# Therefore, projects has many  students but only through the shorlsits
	has_many :shortlists
	has_many :students, through: :shortlists

	#each project can be applied to by several students therefore
	#it has several project applications
	has_many :project_applications, dependent: :destroy
	has_many :students, through: :project_applications


	# ==============================================================
	#orderrs the project by date
	# =============================================================
	#default_scope -> { order(created_at: :desc) }

	# validates the presence of specific fields of the projects
	validates :title, :description, :staff_id, :category, :level_id, presence: true
	validates :url, :format => URI::regexp(%w(http https)), :allow_blank => true
	 validates :visible, presence: { if: 'visible.nil?' }



	# this uses the solr sunspot gem to define the fields that would be searcheable
	# and indexes them
	searchable do

		# The fields of the projects are defined first with the title having the highest boost
		# followed by the tags
		text :title, :boost => 5
		text :description
		text :tags, :boost => 2
		boolean :visible


		string :title do
			self.title
		end

		string :created_at do
			self.created_at
		end

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

		# string :faculty do
		# 	courses.department.department_name
		# end

		# string :department do
		# 	courses.map{|course| course.department.faculty.faculty_name}
		# end


		# this selects all project tags that belong to projects, for searching
		text :project_tags do
			project_tags.map{|project_tag| project_tag.tag_name}
		end

		string :project_tags, :multiple => true do
			project_tags.map{|project_tag| project_tag.tag_name}
		end

		# the level names are also indexed for search
		string :level do
			level.level_name
		end

		# the category names are also indexed for search
		string :category  do
			category.category_name
		end
		#join(:firstname, :target => Staff, :type => :string, :join => {:from => :staff_id, :to => :id})
		
		# the faculty, department and course names are indexed for search
		text :faculties do
			faculties.map{|faculty| faculty.map{|fac| fac.faculty_name}}
		end

		text :departments do
			departments.map{|department| department.map{|dept| dept.department_name}}
		end

		text :courses do
			courses.map{|course| course.course_name}
		end

		#============================================
		# facets
		#============================================

		# These variables are used for the facet
		string :fullname
		string :categoryname
		string :levelname

		# the following define facultyname, departmentname and coursename variables
		# for filtering. The multiple indicates that a projects 
		# has and belongs to multiples of the different objects
		string :facultyname, :multiple => true do
			faculties.map{|faculty| faculty.map{|fac| fac.faculty_name}}
		end

		string :departmentname, :multiple => true do
			departments.map{|department| department.map{|dept| dept.department_name}}
		end

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
		
		# this method defines the category_name 
		# which is used for the filter
		def categoryname
			category.category_name
		end

		# this method defines the level_name 
		# which is used for the filter
		def levelname
			level.level_name
		end



		# def faculty
		# 	department.faculty
		# # 	course.department.department_name
		# end


		#This method gets all departments for all courses in the project
		#ensure that only one entry for a particular department is returned
		def departments
			departments = []
			courses.each do |c|
				dept = Department.where(:id => c.department_id)
				if !departments.include? dept
					departments.push(dept)
				end
				return departments
			end
			return departments
		end	


		#This method gets all faculties for all the deprtments for all the courses in the projects
		#ensure that only one entry for a particular faculty is returned
		# def faculties	
		# 	fac1 = Department.where(id: courses.map{|m| m.department_id})
		# 	fac2 = fac1.map{|f| f.faculty_id}
		# 	fac2.uniq!
		# 	faculties = fac2.map{ |f| Faculty.where(:id => f)}
		# 	#faculties = fac1.map{ |f| Faculty.where(:id => f.faculty_id)}
		# end

		def faculties
			
			faculties = []
			departments.each do |department|
				department.each do |d|
					fac = Faculty.where(:id => d.faculty_id)
					if !faculties.include? fac
						faculties.push(fac)
					end
					return faculties
				end
				return faculties
			end
			return faculties
		end

		# def validate_url(url)
		# 	error = false
		# 	if url.include? " " || !url.include? "."
		# 		error = true
		# 	end
		# 	if !url.include? "http://" || !url.include? "https://"
		# 		error = true
		# 	end
		# end
	
end
