class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def events
		@user.mapevents = Mapevent.all
	end

	def create
		@user = User.create(user_params)

		if @user.valid? && @user.save
			redirect_to mapevents_path
		else
			render :new
		end
	end

	def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end

end
