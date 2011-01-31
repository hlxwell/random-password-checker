module RandomPassword
  class Railtie < Rails::Railtie
    initializer "randome_password.include_to_active_record_and_action_controller" do
      ActiveRecord::Base.send(:include, RandomPassword::PasswordChecker)
      ActionController::Base.send(:include, RandomPassword::PasswordChecker)
    end
  end
end