extends Node2D

class_name LineaObstaculo

signal jugador_golpeado


@export var obstaculo_tcn = preload("res://src/escenas/obstaculo.tscn")
@export var contador_obstaculos = 3
@export var distancia_entre_obstaculos = 128
@export var velocidad = 200
@export var limite_movimiento_x = 304
@export var spawn_por_la_izquierda = true
@onready var escena_obstaculo: PackedScene = obstaculo_tcn

var obstaculos = []

func _ready() -> void:
	for i in contador_obstaculos:
		
		var obstaculo = escena_obstaculo.instantiate()
		if spawn_por_la_izquierda:
			obstaculo.position = Vector2(-limite_movimiento_x + distancia_entre_obstaculos * i, 0)
		else:
			obstaculo.position = Vector2(limite_movimiento_x + distancia_entre_obstaculos * i, 0)
			obstaculo.get_node("AnimatedSprite2D").set_flip_h(true)

		obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
		add_child(obstaculo)
		obstaculos.append(obstaculo)
		obstaculo.get_node("AnimatedSprite2D").play("obstaculo_animation")

func _process(delta: float) -> void:
	var dir = 1
	if not spawn_por_la_izquierda:
		dir = -1
		
	for obstaculo in obstaculos:
		var nueva_posicion_x = (dir * velocidad) * delta + obstaculo.position.x

		if spawn_por_la_izquierda and nueva_posicion_x > limite_movimiento_x:
			obstaculo.position.x = -limite_movimiento_x
		elif not spawn_por_la_izquierda and nueva_posicion_x < -limite_movimiento_x:
			obstaculo.position.x = limite_movimiento_x
		else:
			obstaculo.position.x = nueva_posicion_x

func on_jugador_entra_obstaculo(area: Area2D):
	if area is Jugador:
		jugador_golpeado.emit()
