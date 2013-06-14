require 'test_helper'

class CooksControllerTest < ActionController::TestCase
  setup do
    @cook = cooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cook" do
    assert_difference('Cook.count') do
      post :create, cook: { age: @cook.age, bio: @cook.bio, first_name: @cook.first_name, last_name: @cook.last_name }
    end

    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should show cook" do
    get :show, id: @cook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cook
    assert_response :success
  end

  test "should update cook" do
    put :update, id: @cook, cook: { age: @cook.age, bio: @cook.bio, first_name: @cook.first_name, last_name: @cook.last_name }
    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should destroy cook" do
    assert_difference('Cook.count', -1) do
      delete :destroy, id: @cook
    end

    assert_redirected_to cooks_path
  end
end
