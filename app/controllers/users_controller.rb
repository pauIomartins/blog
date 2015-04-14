class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to articles_path, :notice => 'User sucessfully added.'
		else
			render :action => 'new'	
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to articles_path, :notice => "Updated user information sucessfully."
		else
			render :action => edit
		end	
	end

    private
        def user_params
        	params.require(:user).permit(:email, :password)
   		end	
end
