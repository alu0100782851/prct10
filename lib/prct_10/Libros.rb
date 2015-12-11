class Libros < Bibliografias

    attr_accessor :volumen, :editor

    def initialize(autores, titulo, publicacion, edicion, volumen, editor)
        super(autores,titulo,publicacion,edicion)
        @volumen = volumen
        @editor = editor
    end

    def to_s
        "#{@autores} (#{@publicacion}). #{@titulo} (#{@edicion}) (#{@volumen}). #{@editor}.\n"
    end

end