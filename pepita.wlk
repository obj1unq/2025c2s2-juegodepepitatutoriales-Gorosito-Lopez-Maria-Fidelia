
object pepita {
	var energia = 100
	var property position = game.center()
	var meta = nido


	method meta(_meta){
		meta = _meta
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method estadoDePepita(){
		if (self.atrapadaPor(silvestre)||energia <= 0){
			return "-gris"
		} else if(meta.estaEnElNido(self)){
			return "-grande"
		}
		else{
			return ""
		}
	}

	method image(){
		return "pepita" + self.estadoDePepita() + ".png"
	}


	method atrapadaPor(personaje){
		return self.position() == personaje.position()
	}

	method irA(nuevaPosicion){
		if(energia > 0 ){
			self.volar(position.distance(nuevaPosicion))
			position= nuevaPosicion
			energia = energia - 9
		}
	}

	method ganar(){
		game.say(self,"ganar")
	}
}

object alpiste {
  var property position = game.at(7,7)
  method image() = "alpiste.png"
  const energia = 3

  method energiaQueOtorga(){
	return energia
  }
}

object bloque {
  var property position = game.at(1,5)
  method image() = "muro.png"
}

object manzana {
  var property position = game.at(7,3)
  const energia = 5
  method image() = "manzana.png"

  method energiaQueOtorga(){
	return energia
  }
}


object config {
	method configTeclas() {
	  keyboard.left().onPressDo({pepita.irA(pepita.position().left(1))})
	  keyboard.right().onPressDo({pepita.irA(pepita.position().right(1))})
	  keyboard.up().onPressDo({pepita.irA(pepita.position().up(1))})
	  keyboard.down().onPressDo({pepita.irA(pepita.position().down(1))})
	  
	}
}

object silvestre{
	var position = game.origin()

	method centrar(){
		position = game.center()
	}

	method image() = "silvestre.png"

	method position(){
		return game.at(pepita.position().x(), 0)
	}

	method position(_position){
		position = _position
	}
}

object nido {
  method image() = "nido.png"

  method position() = game.at(1,8)

  method estaEnElNido(personaje){
	return personaje.position() == self.position()
  }
}
