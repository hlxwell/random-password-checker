require 'md5'

module RandomPassword
  class NoKeyError < Exception
    def initialize(message = nil)
      super(message || "You didn't set PASSWORD_KEY in your project!")
    end
  end

  module PasswordChecker
    # Newly generated password will be available in 1 minute.
    # better to use password_key to get different passwords for each project.
    def verify_random_password(password = nil, password_key = "1f084357c39e197a18672e16d1551033")
      return false unless password
      # raise NoKeyError unless password_key
      return correct_password(password_key) == password
    end

    def correct_password(password_key)
      # get salt
      datetime = Time.now.utc.strftime("%Y%m%d%H%M")
      puts datetime
      salt = datetime + password_key
      # make a absolute random string.
      string_result = MD5.new(salt).to_s
      # get 3 chars in header and footer.
      string_result[0..2] + string_result[-3..-1]
    end
  end
end