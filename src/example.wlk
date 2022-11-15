
class Seleccion{
	
	const property listaGoles = []
	
	
	method realizarUnGol(gol){
		listaGoles.add(gol)
	}
	
	method golesTotales() = listaGoles.size()
	
	method golesDePenal() = listaJugadores.sum{ gol => gol.numeroGolesDePenal()}
	
	
}

class Gol{
	
	const property jugador
	const property seleccionOpuesta
	const property minuto
	const property penal = false
		
}

class Jugador{
	
	const property golesRealizados = []
	
	method registrarGol(gol){
		golesRealizados.add(gol)
	}
	
	method numeroGolesDePenal() = golesRealizados.count{gol => gol.penal()}
	
	method seleccionQueMasRecibioMisGoles() = golesRealizados.max{golesRealizados.count{gol => gol.seleccionOpuesta()}}
	
	method golALaMismaSeleccion(seleccion){
		if(self.mismaSeleccion(seleccion))
			
	}
	
}