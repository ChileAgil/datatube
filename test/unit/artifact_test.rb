require 'test_helper'

class ArtifactTest < ActiveSupport::TestCase
  test "should be valid" do
    artifact = Factory(:artifact)
    
    assert artifact.valid?
  end
  
  test "Should have a name" do
    artifact = Factory(:artifact, :name => nil)
    
    assert !artifact.valid?
    #assert_not_nil artifact.errors[:name]
  end
  
  test "should save" do
    artifact = Factory.build(:artifact)
    
    assert artifact.save
    assert_equal Artifact.last, artifact
  end
  
  test "Should find by name" do
    artifact =  Factory.build(:artifact,  :name => 'Foo Data')
    artifact.save
    
    assert_equal Artifact.search('foo').last, artifact
    assert_equal Artifact.search('data').last, artifact
    assert_equal Artifact.search(artifact.name).last, artifact
    assert_not_equal Artifact.search('Garbage').last, artifact
  end
  
  test "should have tags" do
    artifact =  Artifact.new :name => 'Some new Artifact'
    
    assert_equal artifact.tags, []
    assert_equal artifact.tag_list, ''
    
    artifact.tag_list = "foo, bar"
    
    assert_equal artifact.tags, ['foo', 'bar']
  end
  
  test "shouldn't store empty tags" do
    artifact =  Artifact.new :name => 'Some new Artifact'
    artifact.tag_list = " foo, , bar "
    
    assert_equal artifact.tags, ['foo', 'bar']
  end
  
  test "Should count downloads" do
    artifact =  Artifact.new :name => 'Foo Data', :url => 'some/url'
    
    assert_difference('artifact.download_count', 1) do
      assert_equal artifact.download!, 'some/url'
    end
  end
end
