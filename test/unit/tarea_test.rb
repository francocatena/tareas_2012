require 'test_helper'

class TareaTest < ActiveSupport::TestCase
  setup do
    @tarea = tareas(:ir_al_curso)
  end

  test 'el nombre no puede estar en blanco' do
    @tarea.nombre = ''
    assert @tarea.invalid?
    assert_equal 1, @tarea.errors.size
    assert_equal I18n.t('errors.messages.blank'), @tarea.errors[:nombre].first
  end

  test 'marcar como completa una tarea' do
    assert !@tarea.completa

    assert @tarea.completa!

    assert_equal true, @tarea.reload.completa
  end

  test 'se deben notificar las tareas por vencer' do
    ActionMailer::Base.delivery_method = :test

    assert_difference 'ActionMailer::Base.deliveries.size' do
      Tarea.recordar_vencimientos
    end
  end
end
