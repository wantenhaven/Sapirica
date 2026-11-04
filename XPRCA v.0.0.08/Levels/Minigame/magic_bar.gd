extends TextureProgressBar

var flow: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	flow = randf_range(-0.05, 0.1)
	
	if value > 80: #DEATH RESIST
		flow = (flow + 2) * 2
		
	elif value > 75: #TENSION
		flow += 0.09
		
	elif value > 60: #REGULAR
		flow += 0.01

	elif value > 40: #KILLER
		flow -= 0.01
	
	elif value > 20: #MERCY OR DEATH STRIKE
		flow -= 0.2
		

	print(flow)
	
	value -= flow #0.1
	# MAGIC FLOW TOUGH
	"""
	flow = randf_range(-0.05, 0.1)
	print(flow)
	
	#BIG JUMP
	if flow > 0.099:
		flow = 50
		print("big jump")
		
	if value > 60:
		flow += 0.01
	elif value > 75:
		flow += 0.05
	elif value > 80:
		flow += 1.8

	
	value -= flow #0.1
	"""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter"):
		value += 2
