class WelcomeController < ActionController::Base
  def index
    puts "Generate new charge"
    @token = Braintree::ClientToken.generate
  end

end
