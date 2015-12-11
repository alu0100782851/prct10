Nodo = Struct.new(:value, :siguiente, :previo)

class Lista
    
    attr_accessor :head, :tail, :contador
    
    include Enumerable
    
    def initialize
        @head = nil     #inicio de la lista
        @tail = nil     #fin de la lista
        @contador=0     #variable que determina el tamaño actual de la lista
    end
    
    
    def insert_head(nodo)
    
        if @head.nil?
                @head = nodo
                @tail = @head
            else 
                @head.previo = nodo
                nodo.siguiente = @head
                @head = @head.previo
            
        end
        @contador+= 1   #Aumentamos variable que indica tamaño de la lista 
        ordenar_list
        
    end
    
    
    def insert_tail(nodo)

        if @head.nil?
			    @head = nodo
			    @tail = @head
		    else
                @tail.siguiente = nodo
		        nodo.previo = @tail
		        @tail = @tail.siguiente
        
        end
        @contador+=1
        ordenar_list
        
    end
    
    
    def extract_head
        aux = @head
        if @head == nil
            return nil
        end
        if @head == @tail
				@head = nil
				@tail = nil
			else
				@head = @head.siguiente
				@head.previo = nil
        end
        @contador-=1
        return aux.value
    end
    
    
    def extract_tail
        aux = @tail
        if @tail == nil
            return nil
        end
        
        if @head == @tail
				@head = nil
				@tail = nil
		    else
				@tail = @tail.previo
				@tail.siguiente = nil
        end
		@contador-=1
        return aux.value
    end
    
    
    def to_s

        aux = @head
        var_a=''
=begin   
        if empty != true
            puts "\nREFERENCIAS BIBLIOGRAFICAS\n"
        end
=end

        while !aux.nil?
            #print "#{aux.value}\n"
            var_a = "#{var_a}" + "#{aux.value}"
            aux = aux.siguiente
        end

        return var_a
    end
    
    
    def empty
        return contador==0
    end
    
    
    def each
	   actual = @tail
	
		while actual != nil
		   yield actual.value
		   actual = actual.siguiente
		end
    end
    
    
    
end