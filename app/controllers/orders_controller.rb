class OrdersController < ApplicationController
  
  include CurrentRegistro
  before_action :set_registro, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :destroy]
  
  def index
	  @orders = Order.all 
	end
	
	def new
		if @registro.curso_items.empty?
			redirect_to shop_url, notice: 'Tu Registro esta VACIO'
			return
		end
		@order = Order.new
	end
	
	def create
		@order = Order.new(order_params)
		@order.add_curso_items_from_registro(@registro)
		if @order.save
			Registro.destroy(session[:registro_id])
			session[:registro_id] = nil
			redirect_to root_url, notice: 'Gracias por tu Inscripcion!'
		else
		  render :new, notice: 'Por favor revisa tu Formulario'
		end
	end
	
	def show
	end
	
	def destroy
		@order.destroy
		redirect_to root_url, notice: 'Incripcion Eliminada'
	end
	
	private
	
	def set_order
		@order = Order.find(params[:id])
	end
	
	def order_params
		params.require(:order).permit(:name, :email, :address,:telefono, :city, :country)
	end
  	
end