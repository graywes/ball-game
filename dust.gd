extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	restart()
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
