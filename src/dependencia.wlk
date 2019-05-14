import rodados.*

class Dependencia {
	var pedidos=[]
	const flota = #{}
	var property empleados = 0
	method agregar(pedidos){
		
	}
	method remover(pedidos){
		
	}
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}
	
	method pesoTotalFlota() = flota.sum { r => r.peso() }
	
	method estaBienEquipada() {
		return flota.size() >= 3 and flota.all { r => r.velocidadMaxima() >= 100 } 
	}
	
	method capacidadTotalEnColor(unColor) {
		return flota
			.filter { r => r.color() == unColor }
			.sum { r => r.capacidad() }
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max { r => r.velocidadMaxima() }.color()
	}
	
	method capacidadFaltante() {
		return empleados - self.capacidadTotal()
	}
	
	method capacidadTotal() {
		return flota.sum { r => r.capacidad() }
	}
	
	method esGrande() {
		return empleados >= 40 and flota.size() >= 5
	}
}
class Pedido{
	var property distancia;
	var property tiempoMaximo=3
	var property pasajeros;
	var coloresIncompatibles=#{};

method velocidadRequerida(){
		return distancia/tiempoMaximo;
	}
method puedeSatifacerPedido(auto){
	return auto.velocidadMaxima()>self.velocidadRequerida()+10
	and auto.capacidad()>=pasajeros
	and not coloresIncompatibles.contains(auto.color())
}
method acelerar(){
	tiempoMaximo=(tiempoMaximo-1).max(1)
	}
method relajar(){
	return tiempoMaximo++
}
}



