require 'test_helper'

class PestsControllerTest < ActionController::TestCase
  setup do
    @pest = pests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pest" do
    assert_difference('Pest.count') do
      post :create, pest: { description: @pest.description, justification: @pest.justification, title: @pest.title }
    end

    assert_redirected_to pest_path(assigns(:pest))
  end

  test "should show pest" do
    get :show, id: @pest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pest
    assert_response :success
  end

  test "should update pest" do
    patch :update, id: @pest, pest: { description: @pest.description, justification: @pest.justification, title: @pest.title }
    assert_redirected_to pest_path(assigns(:pest))
  end

  test "should destroy pest" do
    assert_difference('Pest.count', -1) do
      delete :destroy, id: @pest
    end

    assert_redirected_to pests_path
  end
end
