extends PathFollow2D
var move = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		progress_ratio -= delta * 0.8
		move = -0.8
	if Input.is_action_pressed("right"):
		progress_ratio += delta * 0.8
		move = 0.8
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		pass
	else:
		progress_ratio += move * delta
		move = lerpf(move, 0, delta * 8)
	pass
