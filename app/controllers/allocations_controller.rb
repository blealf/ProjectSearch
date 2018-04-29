class AllocationsController < ApplicationController
	
	def new
    	@per_page = params[:per_page] || 20
		@allocation = Allocation.new()
		@allocations = Allocation.all.order(created_at: :desc).paginate(page: params[:page] || 1, :per_page => @per_page)
	end

	def create
		@allocation = Allocation.create(allocation_params)
		if @allocation.save
			staff = @allocation.staff
			student = @allocation.student
			SendMailsJob.set(wait: 20.seconds).perform_later(staff, student, @allocation)
			#ProjectMailer.send_information(staff, student, @allocation).deliver
			redirect_to new_allocation_path
		else
			render 'new'
		end
	end

	def edit
		@allocation = Allocation.find(params[:id])
		@allocations = Allocation.all.order(created_at: :desc).paginate(page: params[:page] || 1, :per_page => @per_page)
	end

	def update
		@allocation = Allocation.find(params[:id])
		if @allocation.update_attributes(allocation_params)
			redirect_to new_allocation_path
		else
			render 'edit'
		end

	end

	def destroy
		@allocation = Allocation.find(params[:id])
		@allocation.destroy
		redirect_to new_allocation_path, :notice => 'deleted'
	end

	private
		def allocation_params
			params.require(:allocation).permit(:student_id, :staff_id, :supervision_type_id)
		end

end
