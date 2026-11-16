extends Spell

# PARTICLE SPELLS DONT NEED TO BE HIDDEN
func _ready() -> void:
	hide()


func cast_spell(target_pos: Vector2) -> void:
	global_position = PlayerInfo.player_pos
	look_at(get_global_mouse_position())
	show()
	print(global_position)
