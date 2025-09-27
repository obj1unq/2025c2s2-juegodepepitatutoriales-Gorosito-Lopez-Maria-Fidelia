
object pepita {
	var energia = 100
	var property position = game.center()
	var meta = nido


	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}
	method derecha(){
		position = position.right(1)
	}

	method izquierda(){
		position = position.left(1)
	}

	method abajo(){
		position = position.down(1)
	}

	method arriba(){
		position = position.up(1)
	}

	method estadoDePepita(){
		if (self.atrapadaPor(silvestre)){
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

	method hacerPepitaGrande() = "pepita-grande.png"

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

  method position() = game.at(5,5)

  method estaEnElNido(personaje){
	return personaje.position() == self.position()
  }
}
