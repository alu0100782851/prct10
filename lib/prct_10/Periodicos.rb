class Periodicos < Bibliografias
	
	attr_accessor :nombre, :paginas
		
	def initialize(autores, titulo, publicacion, edicion=nil, nombre, paginas)
			
		super(autores, titulo, publicacion, edicion)
			
		@nombre = nombre
		@paginas = paginas
			
	end
		
		
	def to_s
		"#{@autores} (#{@publicacion}). #{@titulo}. #{@nombre}, pp. #{@paginas}.\n"		
	end
end