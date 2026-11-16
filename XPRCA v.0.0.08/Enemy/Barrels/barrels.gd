extends Enemy	## this cannot be an enemy becasue the enemy queues free when it dies.
class_name Destroyable_Barrel

@onready var sprite = $EnemySprite
@export var respawnTime: float = 1

func health_updated() -> void:
	healthbar.value = health
	if health <= 0:
		sprite.hide()
		print(respawnTime)
		await get_tree().create_timer(respawnTime).timeout
		health = max_health
		update_healthbar()
		sprite.show()
		print("max health is " + str(max_health))

func update_healthbar():
	healthbar.value = health
	
func _on_respawnable_hurtbox_health_changed() -> void:
	health_updated()
	print(health)
