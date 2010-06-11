class ArtifactsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def show
  	@artifact = Artifact.find(params[:id])
  end
  
  def search
    if params[:q].blank?
      flash[:error] = "No se proporcionó ningún parámetro de búsqueda"
      redirect_to root_path
    else
      @artifacts = Artifact.search( params[:q] ).paginate( :page => params[:page] )
    end
  end
  
  def petition
  end
end
