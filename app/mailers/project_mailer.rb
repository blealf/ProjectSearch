class ProjectMailer < ApplicationMailer

	default from: "blealfrails@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.send_information.subject
  #

  # sends mail to the staff
  # sets the message, header(or Subject of the mail)
  # the staff and student concerned. This is being used for the
  # project application and project suggestions
  #def send_information(reciever, reply_to, header, message, project)

  # The method accepts variable arguments because
  # the feedback only requires two arguements
  #
  # the position of the other arguements are:
  #reciever = args[0]
  #reply_to  = args[1]
  #subject = args[2]
  #message = args[3]
  #project = args[4]
  #
  def send_information(*args)

    if args[-1].is_a?(Feedback)
      @message = args[0]
      @project = args[-1]
      mail to: Admin.first().email, subject: "Project System Feedback" 
    elsif args[-1].is_a?(Allocation)
      @staff = args[0]
      @student = args[1]
      @project = args[-1]
      mail to: "#{@staff.email}, #{@student.email}", subject: "Project Supervision" 
    else
      @reciever = args[0]
      @reply_to  = args[1]
      @message = args[3]
      @project = args[4]
      mail to: @reciever.email, subject: args[2], reply_to: @reply_to.email, cc: Admin.first().email
    end
  end


end
