class Celda
    attr_accessor :nextCelda, :valor

    def initialize(valor:)
        @nextCelda = nil
        @valor = valor
    end

    def PrintCelda
            print( "#{@valor}")
    end
end
#------------------------------------------------------
class Fila
    attr_accessor :primeraCelda, :ultimaCelda, :nextFila

    def initialize()
        @primeraCelda = nil
        @ultimaCelda = nil
        @nextFila = nil
    end

    def nuevaCelda()
        celda = Celda.new(valor:0)
        if @primeraCelda == nil
             @PrimeraCelda = celda
             @ultimaCelda = @primeraCelda
        else
            @ultimaCelda.nextCelda = celda
            @ultimaCelda = celda
        end
    end 

    def contarColumnas(tamcolum:)
        for i in 1..tamcolum do
            nuevaCelda()
        end
    end


    def printFila
            temp = @primeraCelda
        while !(temp.nil?)
            temp.printCelda
            puts " -> "
            temp = temp.nextCelda
            if temp.nextCelda == nil  
            puts " -> nullptr"
            end
        end
    end

    def posColumna(posFila:)
        temp = @primeraCelda
        cont = 1
        while !(temp.nil?)
            if cont == posFila
                return temp
            end
            temp = temp.nextCelda
            cont = cont+1
        end
        return nil
    end     
end
#---------------------------------------------------------------------
class Hoja
    attr_accessor :primeraFila, :numFila, :numCol

    def initialize()
        fila = Fila.new()
        fila.nuevaCelda()
        @primeraFila = fila
        @numFila = 1
        @numCol = 1
    end

    def nuevaColumna()
        temp = @primeraFila
        while !(temp.nil?)
            temp.nuevaCelda()
            temp = temp.nextFila
        end
        @numCol = @numCol + 1
    end

    def nuevaFila()
        fila = Fila.new()
        fila.contarColumnas(tamcolum: @numCol)
        if @primeraFila == nil
            @primeraFila = fila
        else
            temp = @primeraFila
            while !(temp.nextFila.nil?)
                temp = temp.nextFila
            end
            temp.nextFila = fila
        end
        @numFila = @numFila+1
    end

    def setValor(fila: , numCol: , num:)
        if fila > @numFila 
            puts "Fila ingresada fuera de rango"
        elsif numCol > @numCol
            puts "Columna ingresada fuera de rango"
        elsif fila <= 0
            puts "Filas insuficientes"
        elsif
            puts "Columnas insuficientes"
        else
            fila = posFila(posCelda: fila)
            celda = fila.posColumna(posFila: numCol)
            celda.valor = num
        end
    end

    def posFila(posCelda:)
        temp = @primeraFila
        cont = 1
        while !(temp.nil?)
            if cont == posCelda
                return temp
            end
            temp = temp.nextFila
            cont = cont + 1
        end
        return nil
    end

    def printHoja()
        temp = @primeraFila
        while !(temp.nil?)
            temp.printFila()
            temp = temp.nextFila
        end
    end

    def printDatos()
        print ("Numero de filas: #{@numFila}\n")
        print ("Numero de columnas: #{@numCol}\n")
    end


    def getCelda(fila: , col:)
        if fila > @numFila 
            puts 
            return nil
        elsif numCol > @numCol
            puts 
            return nil
        elsif fila <= 0
            puts 
            return nil
        elsif col <= 0
            puts 
            return nil
        else
            fila = posFila(posCelda: fila)
            celda = fila.posColumna(posFila: col)
            return celda
        end
    end

    def sumaRango(fila1:, posCol1:, fila2: ,posCol2:)
        res = 0
        for i in fila1..fila2
            for j in posCol1..posCol2
                celda = getCelda(fila:i ,col: j)
                res = res + celda.valor
            end
        end
        return res
    end
    
    def promRango(fila1:, posCol1:, fila2: , posCol2:)
        res = 0
        cont = 0
        for i in fila1..fila2
            for j in posCol1..posCol2
                celda = getCelda(fila: i , col: j)
                cont = cont + 1
                res = res + celda.valor
            end
        end
        return res.to_f/cont
    end
end