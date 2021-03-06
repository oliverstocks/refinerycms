require 'test_helper'

class InquiryTest < ActiveSupport::TestCase

  fixtures :inquiries

  def setup
    @new_inquiry = Inquiry.new
    @bad_email_inquiry = Inquiry.new(:email => "foo.bar.com", :name => "Dave")
    @valid_inquiry = Inquiry.new(:email => "foo@bar.com", :name => "Dave")
    @full_valid_inquiry = Inquiry.new(:email => "foo@bar.com", :name => "Dave", :phone => "3232332", :message => "message")
  end

  def test_should_force_name_and_email_to_be_valid
    assert !@new_inquiry.save

    assert_equal "can't be blank", @new_inquiry.errors.on('name')
    assert_equal "must be valid", @new_inquiry.errors.on('email')

    assert_nil @new_inquiry.errors.on('phone')
    assert_nil @new_inquiry.errors.on('message')

    assert !@bad_email_inquiry.save
    assert_equal "must be valid", @bad_email_inquiry.errors.on('email')
    assert_nil @bad_email_inquiry.errors.on('phone')
    assert_nil @bad_email_inquiry.errors.on('message')
    assert_nil @bad_email_inquiry.errors.on('name')

    assert @valid_inquiry.save
    assert @full_valid_inquiry.save
  end

end
