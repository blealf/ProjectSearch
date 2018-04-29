class FeedbacksController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:index, :destroy]

  #authorize student
  before_action :student_logged_in!, only: [:new]

  def index
    @per_page = params[:per_page] || 10
  	@feedbacks = Feedback.all.order(created_at: :desc).paginate(page: params[:page] || 1, :per_page => @per_page)
  end

  def new
  	@feedback = Feedback.new
  end

  def create
  	@feedback = current_student.feedbacks.build(feedback_params)
  	if @feedback.save
  		message = "A student has written a feedback for the project system"
  		SendMailsJob.set(wait: 20.seconds).perform_later(message, @feedback)
  		#ProjectMailer.send_information(message, @feedback).deliver
  		redirect_to current_student, :notice => "sent"
  	else
  		render 'new'
  	end
  end

  def destroy
  	@feedback = Feedback.find(params[:id])
  	@feedback.destroy
  	redirect_to feedbacks_path
  end

  private
  	def feedback_params
  		params.require(:feedback).permit(:body, :student_id)
  	end
end
