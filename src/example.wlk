class Prenda{
 	var estado
 	const precioSegunTipo
 	method precio() = estado.precioPorEstado(precioSegunTipo)
 }
 
 class Sacos inherits Prenda{
 }
 
 class Pantalones inherits Prenda{
 }
 
 class Camisas inherits Prenda{
 }
 
 object nueva{
 	method precioPorEstado(precioSegunTipo) = precioSegunTipo
 }
 
 class Promocion{
 	const valorFijo
 	method precioPorEstado(precioSegunTipo) = precioSegunTipo - valorFijo
 }
 
 object liquidacion{
 	method precioPorEstado(precioSegunTipo) = precioSegunTipo / 2
 }
 

class Venta{
	var modoDePago
	var property fecha
	var prendas = #{}
	 
	method cargarPrenda(prenda){
		prendas.add(prenda)
	}
	method precioTotalDeLaVenta(){
		 prendas.map({prenda => modoDePago.tipoDePago(prenda.precio())})
	}
	
	method realizarVenta(prenda){
		self.cargarPrenda(prenda)
		self.precioTotalDeLaVenta()
	}
		
}

class MacoWins{
	var ventasRealizadas = #{} 
	
	method ventasDia(dia)  = ventasRealizadas.filter({venta => venta.fecha() == dia})
	
	method gananciaDelDia(dia) = self.ventasDia(dia).sum({venta => venta.precioTotalDeLaVenta()})
	
}



class Tarjetas{
	const coeficienteFijo
	var cuotas
	method tipoDePago(precioDeLaPrenda) = precioDeLaPrenda + self.recargo(precioDeLaPrenda)
	method recargo(precioDeLaPrenda) =  cuotas * coeficienteFijo + (precioDeLaPrenda * 0.01)
}

object efectivo{
	method tipoDePago(precioDeLaPrenda) = precioDeLaPrenda
}
