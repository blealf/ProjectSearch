class SupervisionType < ActiveRecord::Base
	has_many :allocations

	validates :name, presence: true
end
