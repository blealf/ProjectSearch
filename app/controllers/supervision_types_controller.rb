class SupervisionTypesController < ApplicationController

	def new
		@supervision_type = SupervisionType.new()
		@supervision_types = SupervisionType.all.order(:name)
	end

	def create
		@supervision_type = SupervisionType.create(supervision_params)
		if @supervision_type.save
			redirect_to new_supervision_type_path
		else
			render 'new'
		end
	end

	def edit
		@supervision_type = SupervisionType.find(params[:id])
		@supervision_types = SupervisionType.all.order(:name)
	end

	def update
		@supervision_type = SupervisionType.find(params[:id])
		if @supervision_type.update_attributes(supervision_params)
			redirect_to new_supervision_type_path
		else
			render 'edit'
		end
	end

	def destroy
		@supervision_type = SupervisionType.find(params[:id])
		@supervision_type.destroy
		redirect_to new_supervision_type_path, :notice => 'deleted'
	end

	private
		def supervision_params
			params.require(:supervision_type).permit(:name)
		end



end
