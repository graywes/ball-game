extends Camera2D
var shak = false
var amount = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shake(am):
	shak = true
	$Timer.start()
	amount = am
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shak:
		offset = Vector2(randf(), randf()) * amount
	else:
		offset = Vector2.ZERO
	pass


func _on_timer_timeout():
	shak = false
	pass # Replace with function body.
