class AdminsController < ApplicationController

  # Authorisation
  # This uses the method from the projects helper to check if a Admin is logged in before
  # granting permission
  before_action :admin_logged_in!, only: [:index, :new, :edit, :update, :show, :destroy]

	def index
		@admins = Admin.all
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			redirect_to @admin
			log_in @admin
		else
			render 'new'
		end
	end

	def show
		set_admin
	end

	def edit
		set_admin
	end

	def update
		set_admin
		if @admin.update_attributes(admin_params)
			redirect_to @admin
		else
			render 'edit'
		end
	end

	def destroy
		set_admin
		@admin.destroy

		#once an admin is removed, redirect to the projects path
		redirect_to projects_path
	end

	private
		def admin_params
			params.require(:admin).permit(:full_name, :pnumber, :email, :tel, :password, :password_confirmation)
		end

		def edit_params
			params.require(:admin).permit(:email, :tel)
		end

		def set_admin
			@admin = Admin.find(params[:id])
		end
end
