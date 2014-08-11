class WelcomeController < ApplicationController
	include ApplicationHelper
	def index
		current_user
		if @current_user
			redirect_to hugs_path
		end
	end
end