extends Node

@onready var jugador: Jugador = $"../jugador" as Jugador
@onready var casas_mananger: Node = $"../casas_mananger" as CasasMananger
@onready var hud: Hud = $"../HUD"


func _ready() -> void:
	casas_mananger.todas_las_casas_llenas.connect(on_todas_las_casas_llenas)
	casas_mananger.casa_ocupa.connect(on_casa_ocupa)
	jugador.vida_perdida.connect(on_vida_perdida)
	jugador.game_over.connect(on_game_over)
	hud.crear_vidas(jugador.vidas)

func matar_jugador():
	jugador.muere()

func on_todas_las_casas_llenas():
	jugador.set_process_input(false)
	hud.mostrar_ganar()
	
func on_casa_ocupa():
	jugador.resetar_jugador()

func on_vida_perdida():
	hud.perder_vida()
	
func on_game_over():
	hud.mostrar_perder()
