require 'test_helper'

class InLinesControllerTest < ActionController::TestCase
  setup do
    @in_line = in_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_line" do
    assert_difference('InLine.count') do
      post :create, in_line: { description: @in_line.description, justification: @in_line.justification, title: @in_line.title }
    end

    assert_redirected_to in_line_path(assigns(:in_line))
  end

  test "should show in_line" do
    get :show, id: @in_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_line
    assert_response :success
  end

  test "should update in_line" do
    patch :update, id: @in_line, in_line: { description: @in_line.description, justification: @in_line.justification, title: @in_line.title }
    assert_redirected_to in_line_path(assigns(:in_line))
  end

  test "should destroy in_line" do
    assert_difference('InLine.count', -1) do
      delete :destroy, id: @in_line
    end

    assert_redirected_to in_lines_path
  end
end
