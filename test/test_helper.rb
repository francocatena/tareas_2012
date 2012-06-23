ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def identificarse(email = responsables(:franco).email, clave = '123')
    temp_controller, @controller = @controller, SesionesController.new

    post :create, { responsable: { email: email, clave: clave } }, {}
    assert_redirected_to tareas_url
    assert_not_nil session[:responsable_id]

    @controller = temp_controller
  end
end
