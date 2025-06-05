extends Node

class_name  CasasMananger

signal todas_las_casas_llenas
signal casa_ocupa

var contador_casas = 0
var casas_llenas = 0

func _ready() -> void:
	var casas  = get_children() as Array[Casa]
	contador_casas = casas.size()
	for casa in casas:
		casa.entro_casa.connect(on_jugador_entro_casa)

		
func on_jugador_entro_casa():
	print("casa caputrada")
	casas_llenas += 1
	casa_ocupa.emit()
	
	if(casas_llenas == contador_casas):
		todas_las_casas_llenas.emit()
