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

  test 'deberia mostrar index filtrado' do
    get :index, q: 'fran'
    assert_response :success
    assert_not_nil assigns(:responsables)
    assert assigns(:responsables).size > 0
    assert assigns(:responsables).all? { |r| r.nombre =~ /\Afran/i }
  end

  test 'deberia devolver json filtrado' do
    xhr :get, :index, q: 'fran', format: :json
    
    assert_response :success
    
    responsables = ActiveSupport::JSON.decode(@response.body)

    assert_equal 1, responsables.size
    assert responsables.all? { |r| r['nombre'] =~ /\Afran/i }
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
