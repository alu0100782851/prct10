class Doc_electronicos < Bibliografias
		
	attr_accessor :medio, :editor, :url, :acceso
	
	def initialize(autores, titulo, publicacion, edicion, medio, editor, url, acceso)
		
		super(autores, titulo, publicacion, edicion)
		
		@medio = medio
		@editor = editor
		@url = url
		@acceso = acceso
	end
	
	
	def to_s
		"#{@autores} (#{@publicacion}). #{@titulo} (#{@edicion}), [#{@medio}]. #{@editor}. Disponible en: #{@url} [#{@acceso}].\n"
	end
end
