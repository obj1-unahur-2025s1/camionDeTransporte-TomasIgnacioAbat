import camion.*
object knightRider{
    method peso() = 500
    method nivelDePeligrosidad() = 10
}
object bumblebee{
    var transformado = "Auto" // Puede Ser "Auto" o "robot"
    method peso() = 800
    method nivelDePeligrosidad(){
        if(transformado == "Auto"){
            return 15
        }else{
            return 30
        }
    }
    method transformacion() = transformado
    method cambiarDeForma(){
        if(transformado == "Auto"){
            transformado = "Robot"
        }
        if(transformado == "Robot"){
            transformado = "Auto"
        }
    }
}
object paqueteDeLadrillos{
    var cantidadDeLadrillos = 20
    method nivelDePeligrosidad() = 2
    method peso() = cantidadDeLadrillos * 2
    method establecerCantidadDeLadrillos(nuevaCantidad){
        cantidadDeLadrillos = nuevaCantidad
    }
}
object arenaAGranel{
    var peso = 200
    method establecerPesoA(pesoNuevo){
        peso = pesoNuevo
    }
    method nivelDePeligrosidad() = 1
}
object bateriaAntiaerea{
    method tieneMisiles() = true
    method peso(){
        if(self.tieneMisiles()){
            return 300
        }else{
            return 200
        }
    }
    method nivelDePeligrosidad(){
        if(self.tieneMisiles()){
            return 100
        }else{
            return 0
        }
    }
}
object contenedorPortuario {
    const cosasAdentro = []
    method peso(){
        100 + cosasAdentro.forEach({c=>c.peso()})
    }
    method nivelDePeligrosidad(){
        if(cosasAdentro.isEmpty()){
            return 0
        }else{
            return cosasAdentro.max({c=>c.nivelDePeligrosidad()})
        }
    }
}
object residuosRadioactivos{
    var peso = 200
    method establecerPeso(pesoNuevo){
        peso = pesoNuevo
    }
    method nivelDePeligrosidad() = 200
}
object embalajeDeSeguridad{
    var cosaQueEnvuelve = knightRider
    method peso() = cosaQueEnvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEnvuelve.nivelDePeligrosidad() / 2
    method cambiarObjetoQueContiene(unObjeto){
        cosaQueEnvuelve = unObjeto
    }
}