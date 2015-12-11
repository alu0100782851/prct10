require 'spec_helper'
require 'prct_10/Bibliografias'
require 'prct_10/Listas'
require 'prct_10/Revistas'
require 'prct_10/Libros'
require 'prct_10/Periodicos'
require 'prct_10/Doc_electronicos'

describe Bibliografias do

  before :each do
        @libro = Libros.new(["Mario Thomas"],"Las mil noches y una noche","2009","Alfaguara","4","España")
        @articulo = Revistas.new(["Antoine Thomas","Andy Hunt", "Chad Fowler"],"ciencia vs realidad","2010","1º edicion", "2", "2 pag.", "Deliberando a la juventud","España")
        @periodico = Periodicos.new(["Silvia Coppulo", "Leticia Coppulo"], "¡Cómo me gustan los yanquis!", "Viernes, 27 noviembre 2015", "El Periodico", "1")
        @doc_elec = Doc_electronicos.new(["James Harden"], "Como ser el mejor jugador NBA: El camino a la gloria", "2014, 8, 10","6","Web", "Texas, Estados Unidos", "http://James-harde/biografia.com", "2015, 1, 3")
  end

    #Pruebas con la lista y con los nodos
  describe Lista do

    before :each do
      #Nodos que contienen las referencias para hacer las pruebas
      @nodo1 = Nodo.new(@libro)
      @nodo2 = Nodo.new(@articulo)
      @nodo3 = Nodo.new(@periodico)
      @nodo4 = Nodo.new(@doc_elec)

      @lista = Lista.new
      
      @lista_1 = Lista.new
      
    end

    describe "Nodo" do
   
      it "#Debe existir un Nodo de la lista con sus datos y su siguiente" do
        expect(@nodo1.class).to eq(Nodo)
      end 
  
    end
    
    describe "Lista" do

      it "#Se extrae el primer elemento de la lista" do
        @lista.insert_head(@nodo1)
        expect(@lista.extract_head()).to eq(@nodo1.value)
      end
    
      it "#Se puede insertar un elemento" do
     	    @lista.insert_head(@nodo2)
     	    expect(@lista.head.value).to eq(@nodo2.value)
     	    @lista.extract_head()
     end
      
      it "#Debe existir una lista con su cabeza" do
        @lista.insert_head(@nodo2)
        expect(@lista.head.class).to eq(Nodo)
      end
     
    end
    
  end
 
  describe Revistas do  #Pruebas con la clase hija revistas
  
    before :each do
      @revista = Revistas.new(["Antoine Thomas", "Andy Hunt", "Chad Fowler"],"Ciencia vs Realidad","2010","1º edicion", "2", "2 pag.", "Deliberando a la juventud","España")
    end
    
    it "#El objeto pertenece a la clase" do
      expect(@revista.class).to eq(Revistas)
    end
    
    it "#El objeto pertenece a la jerarquia" do
      expect(@revista.class.superclass).to eq(Bibliografias)
    end
    
    it "#El objeto pertenece a la clase Object" do
      @revista.is_a? Object
    end
    
     it "#El objeto pertenece a la clase BasicObject" do
      @revista.is_a? BasicObject
    end
    
  end
  
  describe Libros do  #Pruebas con la clase hija libros
  
    before :each do
      @libro = Libros.new(["Mario Vargas"],"Las mil noches y una noche","2009","Alfaguara","4","España")
    end
    
    it "#El objeto pertenece a la clase" do
      @libro.class == Libros
    end
    
    it "#El objeto pertenece a la jerarquia" do
      expect(@libro.class.superclass).to eq(Bibliografias)
    end
    
     it "#El objeto pertenece a la clase Object" do
      @libro.is_a? Object
    end
    
     it "#El objeto pertenece a la clase BasicObject" do
      @libro.is_a? BasicObject
    end
    
  end
  
  describe "#Modulo comparable" do
    
    it "#La referencia 1 es menor que la referencia 2" do
      expect(@libro < @articulo).to eq(false)
      expect(@periodico < @libro).to eq(true)
      
    end 
    
    it "#La referencia 1 es mayor que la referencia 2" do
      expect(@libro > @articulo).to eq(true)
      expect(@periodico > @libro).to eq(false)
    end
    
    it "#La referencia 1 es igual que la referencia 2" do
      expect(@libro == @articulo).to eq(false)
    end
    	
    it "#La referencia 1 es menor igual que la referencia 2" do
      expect(@libro <= @articulo).to eq(false)
    end
    	
    it "#La referencia 1 es mayor igual que la referencia 2" do
      expect(@libro >= @articulo).to eq(true)
    end
    
  end
  
  describe "#Programacion Funcional"do
      
    before :each do
      #Nodos que contienen las referencias para hacer las pruebas
      @nodo_1 = Nodo.new(@libro)
      @nodo_2 = Nodo.new(@articulo)
      @nodo_3 = Nodo.new(@periodico)
      @nodo_4 = Nodo.new(@doc_elec)

      @lista_2 = Lista.new
      @lista_3 = Lista.new
    end
    
    it "#Los nombres de los autores se formatean correctamente" do
      expect(@articulo.autores).to eq("Thomas, A. & Hunt, A. & Fowler, C.")
    end
    
    
    
  end
  
end