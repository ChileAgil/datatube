class TagsController < ApplicationController
  def index
    @tags = Artifact.tag_cloud
  end
  
  def show
    @artifacts = Artifact.tagged_with(params[:id]).paginate( :page => params[:page] )
  end
end
