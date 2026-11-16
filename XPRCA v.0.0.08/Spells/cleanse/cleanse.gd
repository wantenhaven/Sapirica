extends Spell

@onready var particles = $CPUParticles2D

# PARTICLE SPELLS DONT NEED TO BE HIDDEN
#func _ready() -> void:
#	hide()


func cast_spell(target_pos: Vector2) -> void:
	#player.position = target_pos
	show()
	PlayerInfo.statuses = []
	print(PlayerInfo.statuses)
	self.global_position = PlayerInfo.player_pos
	particles.emitting = true
	PlayerInfo.player_status_changed()
