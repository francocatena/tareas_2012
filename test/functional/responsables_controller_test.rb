require 'test_helper'

class ResponsablesControllerTest < ActionController::TestCase
  setup do
    @responsable = responsables(:franco)
    identificarse
  end

  test 'deberia mostrar index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:responsables)
  end

  test 'deberia mostrar new' do
    get :new
    assert_response :success
  end

  test 'deberia crear un responsable' do
    assert_difference('Responsable.count') do
      post :create, responsable: {
        nombre: 'Jar Jar Binks',
        email: 'jj@sw.com',
        clave: '123'
      }
    end

    assert_redirected_to responsable_url(assigns(:responsable))
  end

  test 'deberia mostrar show' do
    get :show, id: @responsable
    assert_response :success
  end

  test 'deberia mostrar edit' do
    get :edit, id: @responsable
    assert_response :success
  end

  test 'deberia actualizar responsable' do
    put :update, id: @responsable, responsable: { nombre: 'Franco A.' }

    assert_redirected_to responsable_url(assigns(:responsable))
    assert_equal 'Franco A.', @responsable.reload.nombre
  end

  test 'deberia eliminar un responsable' do
    assert_difference('Responsable.count', -1) do
      delete :destroy, id: @responsable
    end

    assert_redirected_to responsables_url
  end
end
