require 'test_helper'

class ArtifactTest < ActiveSupport::TestCase
  test "should be valid" do
    artifact = Artifact.new :name => 'Some new Artifact'
    
    assert artifact.valid?
  end
  
  test "Should have a name" do
    artifact = Artifact.new :name => nil
    
    assert !artifact.valid?
    assert_not_nil artifact.errors[:name]
  end
  
  test "should save" do
    artifact = Artifact.new :name => 'Some new Artifact'
    
    assert artifact.save
    assert_equal Artifact.last, artifact
  end
  
  test "Should find by name" do
    artifact =  Artifact.new :name => 'Foo Data'
    artifact.save
    
    assert_equal Artifact.search('foo').last, artifact
    assert_equal Artifact.search('data').last, artifact
    assert_equal Artifact.search(artifact.name).last, artifact
    assert_not_equal Artifact.search('Garbage').last, artifact
  end
end
