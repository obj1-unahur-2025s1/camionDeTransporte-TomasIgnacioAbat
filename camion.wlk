import cosas.*
object camion {
    const cosasDelCamion = []
    var peso = 1000
    method peso() = peso
    method cosasQueCarga() = cosasDelCamion
    method cargar(cosa){
        cosasDelCamion.add(cosa)
        peso += cosa.peso()
    }
    method descargar(cosa){
        cosasDelCamion.remove(cosa)
        peso -= cosa.peso()
    }
    method pesoPar(){
        return cosasDelCamion.any({c => c.peso() % 2 == 0})
    }
    method hayCosaConPeso(pesoBuscado){
       return cosasDelCamion.any({c => c.peso() == pesoBuscado})
    }
    method primeraCosaPeligrosa(peligrosidadBuscada){
        return cosasDelCamion.find({c => c.nivelDePeligrosidad() == peligrosidadBuscada})
    }
    method cosasConPeligrosidadMayorA(peligrosidad){
       return cosasDelCamion.filter({c => c.nivelDePeligrosidad() > peligrosidad})
    }
    method cosasMasPeligrosasQue(unaCosa){
        return cosasDelCamion.filter({c => c.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
    }
    method estaExcedidoDePeso() = peso > 2500
    method puedeCircularEnRuta(peligrosidadMaxima){
        return not self.estaExcedidoDePeso() && self.cosasConPeligrosidadMayorA(peligrosidadMaxima).isEmpty()
    }
    method tieneCosaQuePeseEntreAlgoYAlgo(pesoMinimo, pesoMaximo){
        return cosasDelCamion.find({c=>c.peso() >= pesoMinimo && c.peso() <= pesoMaximo})
    }
}