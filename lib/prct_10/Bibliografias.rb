class Bibliografias

    attr_accessor :autores , :titulo , :publicacion, :edicion #geters y serters 

    include Comparable
    
    def initialize(autores, titulo, publicacion, edicion)
        
        @autores = APA_autores(autores) #Poner autores en formato APA
        @titulo = APA_titulo(titulo)
        @publicacion = publicacion
        @edicion = edicion
    end
    
    
    def <=>(other)
	
        return nil unless other.is_a?Bibliografias  #Devuelve nil si se cumple que other no es un objeto de tipo bibliografia
       
        if(@autores == other.autores)
		
			if(@titulo == other.titulo)
						return 0 
			else
				    arr = [@titulo, other.titulo]
				    arr.sort_by!{|t| t.downcase}
					
					if(arr.first == @titulo)
						return 1
					end
					    return -1
			end

        else

			arr = [@autores, other.autores]
			arr.sort_by!{|t| t.downcase}
			
			if(arr.first == @autores)
				return -1
			end
    			return 1
        end
		

    end

    def ==(other)
		
        if other.is_a?Bibliografias
            @titulo == other.titulo && @autores == other.autores && @publicacion == other.publicacion &&  @edicion == other.edicion
        else
            false
        end

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