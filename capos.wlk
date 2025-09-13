object rolando {
    const mochila = #{}
    var property capacidadMochila = 2
    //var inmueble = castilloPiedra
    const agenda = []

    method agenda() {return agenda}

    method mochila() { return mochila}

    method encuentra(artefacto){
        agenda.add(artefacto)
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

    method posee() {
        return self.mochila().union(castilloPiedra.arcas())
    }

    method siPosee(objeto) {
        return self.posee().contains(objeto)
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

object armaduraValyria{

}