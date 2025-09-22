
object pepita {
	var energia = 100
	var position = game.center()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method image(){
		if (self.atrapadaPor(silvestre)){
			return "pepita-gris.png"
		} else{
			return  "pepita.png"
		}
	}

	method position(){
		return position
	}

	method position(_position){
		position = _position
	}

	method atrapadaPor(personaje){
		return self.position() == personaje.position()
	}

}

object silvestre{
	var position = game.origin()

	method centrar(){
		position = game.center()
	}
	method derecha(){
		position = position.right(1)
	}

	method izquierda(){
		position = position.left(1)
	}

	method image() = "silvestre.png"

	method position(){
		return game.at(pepita.position().x(), 0)
	}

	method position(_position){
		position = _position
	}
	

}

