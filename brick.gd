extends StaticBody2D
var dust = preload("res://dust.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func crash():
	print("break")
	dust = dust.instantiate()
	get_viewport().get_camera_2d().shake(1.5)
	dust.position = position
	add_sibling(dust)
	queue_free()
