
class SeleccionOpuesta{
	
	var property golRecibido = 0
	
	method recibirGol() {
		golRecibido +=1
	}
	
}



class Seleccion{
	
	const property listaGolesRealizados = []
	const property seleccionesEnfrentadas = #{}
	const property hinchas=[]
	
	
	method realizarUnGol(gol){
		listaGolesRealizados.add(gol)
		seleccionesEnfrentadas.add(gol.seleccionOpuesta())
		hinchas.forEach{hincha => hincha.festejarGol(gol.jugador())}
		
	}
	
	method golesTotales() = listaGolesRealizados.size()
	
	method golesDePenal() = listaGolesRealizados.count{gol => gol.penal()}
	
	method seleccionConMayorCantidadDeGoles() = seleccionesEnfrentadas.max{seleccion => seleccion.golRecibido()}
	
	method agregarHincha(hincha){
		hinchas.add(hincha)
	}	
	
	method recibirGol(){
		hinchas.forEach{hincha => hincha.recibirGol()}
	}
	
	
	
}

class Gol{
	
	const property jugador
	const property seleccionOpuesta
	const property minuto
	const property penal = false
	
}


class Jugador{
	
	const property miSeleccion
	
	
	method realizarGol(seleccion, min, fuePenal){
		const gol = new Gol (jugador = self, seleccionOpuesta=seleccion, minuto = min, penal = fuePenal)
		miSeleccion.realizarUnGol(gol)
		seleccion.recibirGol()
		
	}
	
	//method numeroGolesDePenal() = golesRealizados.count{gol => gol.penal()}
	
	//method seleccionQueMasRecibioMisGoles() = golesRealizados.max{golesRealizados.count{gol => gol.seleccionOpuesta()}}
	
	
}


class Simpatizante{
	
	const property equipo
	var property alegria
	
	
	method festejarGol(jugador){
			alegria +=1	
	}
	
		
	method recibirGol(){}
	
}

class Seguidor inherits Simpatizante{
	
	const property jugadorPreferido
	
	method verificarJugador(jugador) = jugadorPreferido == jugador
	
	override method festejarGol(jugador){
		super(jugador)
		if(self.verificarJugador(jugador))
			alegria = alegria*2
	}
	
	
}

class Fanatico inherits Simpatizante{
	
	var property fanatismo
	
	override method recibirGol(){
		self.comprobarAlegria()
		alegria -= fanatismo
	}
	
	method descuentoAlegria() = (alegria - fanatismo)<0
	
	method comprobarAlegria(){
		if(self.descuentoAlegria())
			self.error("valor de alegria no permitido, no puede ser menor a 0")	
	}
	
}

class FanaticoAlExtremo inherits Fanatico{
	
	override method festejarGol(jugador){
		alegria += fanatismo - 1
		fanatismo += 1
	}
	
	override method recibirGol(){
		super()
		fanatismo += 1
	}
}



