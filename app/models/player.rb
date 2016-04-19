class Player < ActiveRecord::Base

	belongs_to :user
	validates_presence_of :name, :score
end
