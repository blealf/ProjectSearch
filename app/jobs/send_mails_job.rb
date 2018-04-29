class SendMailsJob < ActiveJob::Base
  queue_as :default

  # This schedules the mailing job for the system
  def perform(*args)
    if args[-1].is_a?(Feedback)
      @message = args[0]
      @project = args[1]
      ProjectMailer.send_information(@message, @project).deliver_later
    elsif args[-1].is_a?(Allocation)
      @staff = args[0]
      @student = args[1]
      @project = args[2]
      ProjectMailer.send_information(@staff, @student, @project).deliver_later
    else
      @reciever = args[0]
      @reply_to  = args[1]
      header = args[2]
      @message = args[3]
      @project = args[4]

      ProjectMailer.send_information(@reciever, @reply_to, header, @message, @project).deliver_later
    end
    
  end
end

#bundle exec rake jobs:work