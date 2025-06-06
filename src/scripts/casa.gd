extends Area2D

class_name Casa

signal entro_casa

@onready var casasprite: Sprite2D = $casasprite
@onready var casaspriteobtenido: Sprite2D = $casaspriteobtenido
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_area_entered(area: Area2D) -> void:
	if area is Jugador:
		entro_casa.emit()
		casaspriteobtenido.show()
		casasprite.hide()
		collision_shape_2d.set_deferred("disabled",true)
