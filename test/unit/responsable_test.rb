require 'test_helper'

class ResponsableTest < ActiveSupport::TestCase
  setup do
    @responsable = responsables(:franco)
  end

  test 'nombre no debe estar en blanco' do
    @responsable.nombre = ''
    
    assert @responsable.invalid?
    assert_equal 1, @responsable.errors.size
    assert_equal 'no debe estar en blanco', @responsable.errors[:nombre].first
  end
end
