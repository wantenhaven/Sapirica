extends CharacterBody2D
class_name Respawbable

var direction: Vector2 

@export_category("Enemy Stats")
@export var max_health: float = 10
@export var max_speed: float = 10 
@export var base_damage: float = 10

@export var time_to_respawn: float = 0.5
@export var sprite: Sprite2D
@onready var healthbar: ProgressBar = $Healthbar ## just a slight nitpick, it's preferable to do this since it's slightly faster performance-wise

@onready var enemy: Enemy = owner ## get a reference to parent
@onready var col_shape: CollisionShape2D = $CollisionShape2D ## or possibly check for typos if the assert error pops up


var health: float:
	set(value): 
		health = value
		health_updated()

var speed: float:
	set(value): 
		speed = value

func _ready() -> void:
	var warning_text: String = "The enemy %s is missing a collision shape for its Hurtbox" % enemy.name
	assert(col_shape, warning_text)
	
	health = max_health ## i moved them here since having "@onready" alone didnt update the new max_health at the start
	speed = max_speed
	healthbar.value = max_health

func health_updated() -> void:
	healthbar.value = health
	if health <= 0:
		sprite.hide()
		await get_tree().create_timer(0.5).timeout
		health = max_health
		update_healthbar()
		sprite.show()
		print("max health is " + str(max_health))

func update_healthbar():
	healthbar.value = health


func receive_spell_effect(spell: Spell) -> void:
	spell.spell_effect(enemy)

func receive_damage(damage: float) -> void:
	health -= damage
	print(health)
	emit_signal("health_changed")

func receive_melee_damage(damage: float) -> void:
	health -= damage
