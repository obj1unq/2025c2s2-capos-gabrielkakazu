// PJS
object rolando {
    const mochila = #{}
    const agenda = []
    var property capacidadMochila = 2
    var property morada = castilloPiedra
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
        return mochila + morada.arcas()
    } //+ operador sobrecargado

    method siPosee(objeto) {
        return self.posee().contains(objeto)
    }

    method poder() {
        return self.poderBase() 
            + mochila.sum({artefacto => 
                artefacto.aportePoder(self)})
    }

    method batalla() {
        mochila.forEach({artefacto => artefacto.usar(self)})
        poderBase += 1
    }

    method puedeVencer(oponente) {
        return oponente.poder() < self.poder()
    }

    method puedeConquistar(ubicacion) {
        return self.puedeVencer(ubicacion.dueño())
    }

    method esPoderoso(enemigos){
        return enemigos.all({enemigo => self.puedeVencer(enemigo)})
    // input es un conjunto de enemigos, output es Bool
    }

    method tieneArtefactoFatal(artefactos, adversario){
         return artefactos.any({artefacto =>
             (artefacto.aportePoder(self))> adversario.poder() })
    }

 /*   method obtenerArtefactoFatal(artefactos, adversario){
        if not self.tieneArtefactoFatal(artefactos, adversario) {
            self.error(self + "no tiene artefacto fatal para vencer a " + adversario  )
        } else {artefactos.find({artefacto =>
             (self.poderBase() + artefacto.aportePoder(self))> adversario.poder() })
        } 
    }*/
}

object caterina{
    var property morada = fortalezaAcero
    method poder() {return 28}

}
object archibaldo{
    var property morada = palacioMarmol
    method poder() {return 16}
}

object astra{
    var property morada = torreMarfil
    method poder() {return 14}
}


// LUGAR
object castilloPiedra{

    var property dueño = rolando
    const arcas = #{}
    method arcas() {return arcas}

    method incorpora(artefacto) {
        arcas.add(artefacto)
    }
}

object palacioMarmol{
    var property dueño = archibaldo
    const arcas = #{}
    method arcas() {return arcas}

    method incorpora(artefacto) {
        arcas.add(artefacto)
    }
}

object torreMarfil{
    var property dueño = astra
    const arcas = #{}
    method arcas() {return arcas}

    method incorpora(artefacto) {
        arcas.add(artefacto)
    }
}

object fortalezaAcero{
    var property dueño = caterina
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

    method usar(usuario) {
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

    method usar(usuario) {
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

    method usar(usuario) {
        usos += 1
    }

    method aportePoder(usuario) {
        return 6
    }
}

object libroHechizos{
    var usos = 0

    const hechizos = []

    method validarHechizo() {return not hechizos.isEmpty()}

    method contiene(hechizo) {
        hechizos.add(hechizo)
    }

    method usos() {return usos}

    method usar(usuario) {
        return if (self.validarHechizo()) {
            usos += 1
            hechizos.remove(hechizos.first())
        } 
    }

    method aportePoder(usuario) {
        if (self.validarHechizo()){
            return hechizos.first().aportePoder(usuario)
        } else {
            return 0
        }
    }
}


// HECHIZOS

object bendicion {

    method aportePoder(usuario) {
        return 4
    }
}

object invisibilidad {

        method aportePoder(usuario) {
            return usuario.poderBase()
        }
}

object invocacion {

    method aportePoder(usuario) {
        const deposito = usuario.morada().arcas().asList()
        if (deposito.isEmpty()) {
            return 0
        } else {
            return deposito.map({
                artefacto => artefacto.aportePoder(usuario) }
                ).max()
        }
    }
}