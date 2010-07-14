require 'rubygems'
require 'open-uri'
require 'hpricot'

class ArtifactsController < ApplicationController

  #before_filter :authenticate_user!

  def index
  end
  
  def new
    @artifact = Artifact.new
    
  end
  
  def create
    @artifact = Artifact.new params[:artifact]
    
    if @artifact.save	
    	flash[:notice] = "El artefacto se ha subido correctamente, ahora debes completar la información para terminar el proceso"
		content = open('http://'+@artifact.url).read
	
		doc = Hpricot(content)
		
		meta_title = doc.search("//meta[@name=title]")
		if meta_title.length > 0
			@artifact.name = meta_title[0].attributes['content']
		else
			meta_title = doc.search("//title")
			if meta_title.length > 0
				@artifact.name = meta_title[0].inner_html
			else
				@artifact.name = ""
			end	
		end
		
		meta_description = doc.search("//meta[@name=description]")
		if meta_description.length > 0
			@artifact.description = meta_description[0].attributes['content']
		else
			@artifact.description = ""
		end
      
		render :action => "edit"
    else
      flash.now[:error] = "No se pudo guardar el artefacto"
      render :action => "new"
    end
  end
  
  def show
  	@artifact = Artifact.find(params[:id])
  end
  
  def edit
  	@artifact = Artifact.find(params[:id])

  end
  
  def update
  	@artifact = Artifact.find(params[:id])
	@artifact.update_attributes(params[:artifact])

  	if @artifact.save
  		flash[:notice] = "El artefacto se guardo correctamente"
  		redirect_to @artifact
  	else
  		flash.now[:error] = "No se pudo guardar el artefacto"
      render :action => "edit"
    end
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
  
  def download
    @artifact = Artifact.find(params[:id])
    
    redirect_to @artifact.download!
  end
end
