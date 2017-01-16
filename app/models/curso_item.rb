class CursoItem < ActiveRecord::Base
  belongs_to :curso
  belongs_to :registro

  def total_precio
		curso.precio * quantity
	end
end
