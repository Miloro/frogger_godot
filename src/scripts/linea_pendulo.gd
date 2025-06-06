extends LineaObstaculo

class_name	LineaPendulo

@export var ancho = 50
@export var derecha = true

var sierra


func _ready() -> void:
	var obstaculo = escena_obstaculo.instantiate()
	obstaculo.position = Vector2()
	obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
	var spriteAnimado = obstaculo.get_node("AnimatedSprite2D")
	spriteAnimado.play("sierra_anm")
	sierra = obstaculo
	add_child(obstaculo)

		
func _process(delta: float) -> void:
		var nueva_posicion_x = velocidad * delta + sierra.position.x
		if abs(nueva_posicion_x-ancho) < 10 or abs(nueva_posicion_x-ancho) > abs(2*ancho):
			velocidad = -velocidad
			sierra.get_node("AnimatedSprite2D").set_flip_h(derecha)
			derecha = !derecha
		else :
			sierra.position.x = nueva_posicion_x
