class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		data = params[:user]
		@user = User.find_by(email: data[:email]).try(:authenticate, data[:password])
		if @user 
			session[:user_id] = @user.id
			redirect_to hugs_path
		else
			format.html { render :new }
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end
