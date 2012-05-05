require 'test_helper'

class TareaTest < ActiveSupport::TestCase
  setup do
    @tarea = tareas(:ir_al_curso)
  end

  test 'el nombre no puede estar en blanco' do
    @tarea.nombre = ''
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal 'no debe estar en blanco', @tarea.errors[:nombre][0]
  end
end
