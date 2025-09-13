object rolando {
    const mochila = #{}
    var property capacidadMochila = 2

    method mochila() { return mochila}

    method encuentra(artefacto){
        if (self.puedeRecolectar(artefacto)){
            self.recolecta(artefacto)    
        }

    }

    method puedeRecolectar(artefacto) {
        return self.capacidadMochila() > mochila.size()
    }

    method recolecta(artefacto) {
        mochila.add(artefacto)
    }

    method tiene(artefacto){
        return mochila.contains(artefacto)
    }

    method llegaA(locacion){
        self.mochila().forEach{objeto =>
            locacion.incorpora(objeto)
            self.mochila().remove(objeto)}
    }

}

// LUGAR
object castilloPiedra{
    const arcas = #{}
    method arcas() {return arcas}

    method incorpora(artefacto) {
        arcas.add(artefacto)
    }
}

// ARTEFACTOS
object espadaDestino{

}

object libroHechizos{

}

object collarDivino{

}