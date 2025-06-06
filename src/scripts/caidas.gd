extends LineaObstaculo

class_name	Caidas

@export var derecha = true
signal jugador_se_cae


func _ready() -> void:
	var obstaculo = escena_obstaculo.instantiate()
	obstaculo.position = Vector2()
	add_child(obstaculo)
	obstaculo.area_entered.connect(on_jugador_entra_obstaculo)

		
func _process(delta: float) -> void:
	pass
	
func on_jugador_entra_obstaculo(area: Area2D):
	if area is Jugador:
		jugador_golpeado.emit()
