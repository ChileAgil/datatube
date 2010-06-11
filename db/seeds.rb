# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Artifact.new(
  :name => "Participación en la Copa Mundial de Futbol",
  :format => 'html',
  :description => 'tabla con los equipos participantes a lo largo de la historia del torneo, ya sea en la fase final como en las fases clasificatorias, ordenadas de acuerdo a su primera participación en dichas instancias.',
  :url => 'http://es.wikipedia.org/wiki/Anexo:Equipos_participantes_en_la_Copa_Mundial_de_Fútbol'
).save

Artifact.new(
  :name => "Presidentes de Chile",
  :format => 'html',
  :description => 'Lista con todos los presidentes que a tenido Chile.',
  :url => 'http://es.wikipedia.org/wiki/Presidente_de_Chile#Los_presidentes'
).save

Artifact.new(
  :name => "Tabla de los elementos",
  :format => 'gif',
  :description => 'Imágen con la tabla periodica de los elementos químicos.',
  :url => 'http://www.acienciasgalilei.com/qui/tabla%20periodica.gif'
).save
