extends Area2D

class_name Jugador

signal vida_perdida
signal game_over

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

const INCREMENTO_POSICION = 16
const POSICION_INICIAL_JUGADOR = Vector2(136.0,184)

@export var velocidad =	25
@export var vidas = 3
var muerto = false
var estado = "front"

var nueva_posicion: Vector2 = Vector2.ZERO

func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout():
	vida_perdida.emit()
	vidas -= 1
	print("vidas=", vidas)
	if (vidas==0 ):
		print("perdiste")
		set_process_input(false)
		game_over.emit()
	else:
		resetar_jugador()

func _process(delta: float) -> void:
	
	if nueva_posicion == Vector2.ZERO:
		return
	
	position = lerp(position,nueva_posicion,velocidad*delta)
	
	if position.distance_to(nueva_posicion) < 0.1 and !muerto:
		position = nueva_posicion
		nueva_posicion = Vector2.ZERO
		match estado:
			"front":
				animated_sprite_2d.play("idle_front")
			"back":
				animated_sprite_2d.play("idle_back")
			"perfil":
				animated_sprite_2d.play("idle_perfil")
				



func _input(event: InputEvent) -> void:
	if nueva_posicion != Vector2.ZERO:
		return

	var posicion_modificada

	if event.is_action_pressed("up"):
		posicion_modificada = position + Vector2.UP * INCREMENTO_POSICION
		estado = "back"
		animated_sprite_2d.play("move_back")
	elif event.is_action_pressed("down"):
		posicion_modificada = position + Vector2.DOWN * INCREMENTO_POSICION
		estado = "front"
		animated_sprite_2d.play("move_front")
	elif event.is_action_pressed("right"):
		posicion_modificada = position + Vector2.RIGHT * INCREMENTO_POSICION
		animated_sprite_2d.set_flip_h(false)
		estado = "perfil"
		animated_sprite_2d.play("move_perfil")
	elif event.is_action_pressed("left"):
		posicion_modificada = position + Vector2.LEFT * INCREMENTO_POSICION
		animated_sprite_2d.set_flip_h(true)
		estado = "perfil"
		animated_sprite_2d.play("move_perfil")

	if posicion_modificada:
		mover_jugador(posicion_modificada)
		


	
func mover_jugador(posicion_modificada: Vector2) -> void:
	var tile_offset = 8
	var viewport_size = get_viewport_rect().size
	
	var min_x = tile_offset
	var max_x = viewport_size.x - tile_offset
	var min_y = tile_offset 
	var max_y = viewport_size.y - tile_offset - 16
	
	var posicion_clampeada = Vector2(
		clamp(posicion_modificada.x, min_x , max_x),
		clamp(posicion_modificada.y, min_y , max_y)
	)
	
	nueva_posicion = posicion_clampeada

func muere(por_caida = false):
	collision_shape_2d.set_deferred("disabled",true)
	set_process_input(false)
	muerto = true
	if(por_caida):
		animated_sprite_2d.play("caida")
	else:
		animated_sprite_2d.play("hit")
	timer.start()
	
	
func resetar_jugador():
	collision_shape_2d.set_deferred("disabled",false)
	set_process_input(true)
	global_position = POSICION_INICIAL_JUGADOR
	nueva_posicion = POSICION_INICIAL_JUGADOR
	muerto = false

func _on_caida_area_entered(area: Area2D) -> void:
	if area is Jugador:
		muere(true)
