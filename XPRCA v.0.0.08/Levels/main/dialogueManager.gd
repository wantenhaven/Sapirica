extends SubViewport


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("dialogue initialized")
	Dialogic.start('Intro')
	get_viewport().set_input_as_handled()
	print("dialogue start")
