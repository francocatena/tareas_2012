require 'test_helper'

class ResponsablesControllerTest < ActionController::TestCase
  setup do
    @responsable = responsables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responsables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create responsable" do
    assert_difference('Responsable.count') do
      post :create, responsable: { email: @responsable.email, nombre: @responsable.nombre }
    end

    assert_redirected_to responsable_path(assigns(:responsable))
  end

  test "should show responsable" do
    get :show, id: @responsable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @responsable
    assert_response :success
  end

  test "should update responsable" do
    put :update, id: @responsable, responsable: { email: @responsable.email, nombre: @responsable.nombre }
    assert_redirected_to responsable_path(assigns(:responsable))
  end

  test "should destroy responsable" do
    assert_difference('Responsable.count', -1) do
      delete :destroy, id: @responsable
    end

    assert_redirected_to responsables_path
  end
end
