# Esta clase almacena funciones que simplifican la 
# interacción con el layout de la aplicación
module LayoutHelper
  
  # Permite definir el títuto de la página
  #   llamar desde la vista utilizando <% title 'El título de la página' %>
  def title(page_title)
    @content_for_title = page_title.to_s
  end
  
  # Permite agregar archivos CSS adicionales al layout de la página
  #   utiliza la misma interfaz de stylesheet_link_tag
  #   llamar desde la vista utilizando <% stylesheet 'especial' %>
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  # Permite agregar archivos Javascript adicionales al layout de la página.
  #   utiliza la misma interfaz de javascript_include_tag
  #   llamar desde la vista utilizando <% javascript 'especial' %>
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
