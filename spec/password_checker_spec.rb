# encoding: utf-8
require 'spec_helper'

class User
  include RandomPassword::PasswordChecker
end

describe "random password" do
  before do
    @user = User.new
    @correct_password = @user.correct_password("1f084357c39e197a18672e16d1551033")
  end

  context "verify password" do
    it "should return false if no password is given" do
      @user.verify_random_password.should be_false
    end

    it "should return false if wrong password is given" do
      @user.verify_random_password("asdfasdf").should be_false
    end

    it "should return true if correct password is given" do
      @user.verify_random_password(@correct_password).should be_true
    end
  end
end