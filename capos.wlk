object rolando {
    const mochila = #{}
    var property capacidadMochila = 2
    //var inmueble = castilloPiedra
    const agenda = []
    var property poderBase = 5

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

    method poder() {
        return self.poderBase() 
            + mochila.sum({artefacto => 
                artefacto.aportePoder(self)})
    }

    method batalla() {
        mochila.forEach({artefacto => artefacto.usar()})
        poderBase += 1
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
    var usos = 0

    method usos() {return usos}

    method usar() {
        usos += 1
    }

    method aportePoder(usuario) {
        return if (usos == 0) {
            usuario.poderBase()
            } else {
                usuario.poderBase() / 2
            }
    }

}

object collarDivino{
    var usos = 0

    method usos() {return usos}

    method usar() {
        usos += 1
    }

    method aportePoder(usuario) {
        if (usuario.poderBase() > 6 ) {
            return 3 + self.usos()
        } else {
            return 3
        }

    }

}

object armaduraValyria{
    var usos = 0

    method usos() {return usos}

    method usar() {
        usos += 1
    }

    method aportePoder(usuario) {
        return 6
    }


}

object libroHechizos{
    var usos = 0

    const hechizos = []

    const primerHechizo = hechizo.first()

    method contiene(hechizo) {
        hechizos.add(hechizo)
    }

    method usos() {return usos}

    method usar() {
        return if (self.validarHechizo()) {
            usos += 1
            primerHechizo.activar(self)
            hechizos.remove(primerHechizo)
        } 
    }

    method validarHechizo() {return not hechizos.isEmpty()}

    method aportePoder(usuario) {
        return 0
    }


}

// HECHIZOS

object bendicion {


        method activar(usuario) {

        }


        method aportePoder(usuario) {
        return 0
    }

}

object invisibilidad {

}

object invocacion {

}