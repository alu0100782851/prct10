class Bibliografias

    attr_accessor :autores , :titulo , :publicacion, :edicion #geters y serters 

    include Comparable
    
    def initialize(autores, titulo, publicacion, edicion)
        
        @autores = APA_autores(autores) #Poner autores en formato APA
        @titulo = APA_titulo(titulo)
        @publicacion = publicacion
        @edicion = edicion
    end
    
    
    def APA_autores(other)
        
        string=""
        other.each do |a|
				
			vec = a.split(/\W+/)
			string+=vec[1]
			string+=", "
				
				unless vec[2].nil?
					string+=vec[2][0]
					string+=". "
				end
				
			string+=vec[0][0]
			string+="."
			string+=" & " unless a == other.last
		end
			
        return string
    end
    
    
    def APA_titulo(titulo)
        title = titulo.split(" ").map(&:capitalize).join(" ")  #Poner en mayuscula todo las primeras letras de cada palabra
        return title
    end
    
end