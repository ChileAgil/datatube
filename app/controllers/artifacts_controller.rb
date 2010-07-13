class ArtifactsController < ApplicationController

  def index
  end
  
  def new
    @artifact = Artifact.new
  end
  
  def create
    @artifact = Artifact.new params[:artifact]
    
    if @artifact.save
      flash[:notice] = "El artefacto se guardo correctamente"
      redirect_to @artifact
    else
      flash[:error] = "No se pudo guardar el artefacto"
      render :action => "new"
    end
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
