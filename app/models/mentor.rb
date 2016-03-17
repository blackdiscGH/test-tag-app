class Mentor < ActiveRecord::Base
	paginates_per 25
	acts_as_taggable

	scope :by_mentor_name, -> { order("name ASC") 
	}
end
