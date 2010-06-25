require 'test_helper'

class ArtifactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  
  test "should render new form" do
    get :new
    assert_response :success
  end
  
  test "should create new artifact" do
    assert_difference('Artifact.count', 1) do
      post :create, :artifact => { :name => "test" }
    end
    
    assert_redirected_to artifact_path(assigns(:artifact))
  end
  
  test "should get search" do
    get :search, :q => 'Some search'
    assert_response :success
  end
  
  test "search should redirect to home if no query is supplied" do
    get :search
    assert_not_nil flash[:error]
    assert_redirected_to root_path
  end
end
