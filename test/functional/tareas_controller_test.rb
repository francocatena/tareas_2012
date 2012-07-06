require 'test_helper'

class TareasControllerTest < ActionController::TestCase
  setup do
    @tarea = tareas(:ir_al_curso)
    identificarse
  end

  test 'deberia mostrar index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareas)
  end

  test 'deberia mostrar new' do
    get :new
    assert_response :success
  end

  test 'deberia crear una tarea' do
    assert_difference('Tarea.count') do
      post :create, tarea: {
        nombre: 'Ir al asado',
        detalles: 'Es en el quincho de la UTN'
      }
    end

    assert_redirected_to tarea_url(assigns(:tarea))
  end

  test 'deberia mostrar show' do
    get :show, id: @tarea
    assert_response :success
  end

  test 'deberia mostrar edit' do
    get :edit, id: @tarea
    assert_response :success
  end

  test 'deberia actualizar una tarea' do
    put :update, id: @tarea, tarea: { nombre: 'Ir si o si al curso' }

    assert_redirected_to tarea_url(assigns(:tarea))
    assert_equal 'Ir si o si al curso', @tarea.reload.nombre
  end

  test 'deberia eliminar una tarea' do
    assert_difference('Tarea.count', -1) do
      delete :destroy, id: @tarea
    end

    assert_redirected_to tareas_url
  end

  test 'deberia marcar como completa una tarea' do
    assert !@tarea.completa

    put :completa, id: @tarea

    assert_redirected_to tareas_url
    assert @tarea.reload.completa
  end
  
  test 'deberia marcar como completa una tarea por ajax' do
    assert !@tarea.completa

    xhr :put, :completa, id: @tarea

    assert_response :success
    assert_template 'tareas/_tarea'
    assert @tarea.reload.completa
  end
end
