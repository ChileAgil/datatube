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
      post :create, :artifact => { :remote_url => "test" }
    end
    
    assert_response :success
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
  
  test "should redirect to download url" do
    artifact =  Artifact.create :name => 'Foo Data', :url => 'some/url'
    get :download, :id => artifact.id
    
    assert_redirected_to artifact.url
  end
  
  
  test "should load facebook comments for artifact" do
    artifact =  Factory.create(:artifact)
    
    get :show, :id => artifact.id
    
    assert response_from_page_or_rjs.to_s.match /fb:comments.*xid="#{artifact.id}"/
    #assert response_from_page_or_rjs.to_s.match /fb:comments/
    
    #assert_select "fbcomments"
  end
end
