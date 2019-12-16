require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test "should return contact email" do
    mail = ContactMailer.contact_email(@email = "test@me.com", @message = "Hello test")
    assert_equal ['from@example.com'], mail.to
    assert_equal ['from@example.com'], mail.from
  end

end
