extends LineaObstaculo

class_name	LineaPendulo

@export var ancho = 16*4
@export var derecha = true

var obstaculop

func _ready() -> void:
	var obstaculo = escena_obstaculo.instantiate()
	obstaculo.position = Vector2()
	obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
	obstaculop = obstaculo
	add_child(obstaculo)

		
func _process(delta: float) -> void:
		var nueva_posicion_x = velocidad * delta + obstaculop.position.x
		if abs(nueva_posicion_x-ancho) < 10 or abs(nueva_posicion_x-ancho) > abs(2*ancho):
			velocidad = -velocidad
		else :
			obstaculop.position.x = nueva_posicion_x
