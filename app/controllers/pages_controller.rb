class PagesController < ApplicationController
  def index
  	@cursos = Curso.all
  end

  def shop
  	@cursos = Curso.all
  end 

end
