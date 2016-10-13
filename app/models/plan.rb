class Plan < ActiveRecord::Base

	has_many :users
	validates_presence_of :name, :price, :period, :cycles, :num_doc

end
