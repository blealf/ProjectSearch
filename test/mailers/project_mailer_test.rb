require 'test_helper'

class ProjectMailerTest < ActionMailer::TestCase
  test "send_information" do
    mail = ProjectMailer.send_information
    assert_equal "Send information", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
