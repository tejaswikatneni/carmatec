class HomeController < ApplicationController

	def index
		@users = User.all.sort_by{|user| user.score}.reverse!
	end
end