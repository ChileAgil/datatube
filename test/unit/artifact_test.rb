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
end
