extends CharacterBody2D


var SPEED = 80
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var vel = Vector2(1, 1)

func _physics_process(delta):
	velocity = vel
	var colision = move_and_collide(velocity * delta * SPEED)
	if colision:
		get_viewport().get_camera_2d().shake(0.5)
		print("yewa")
		if colision.get_collider().is_class("AnimatableBody2D") and (colision.get_collider().get_parent().get_parent().position - position).y - 2 >= 0:
			vel = velocity.bounce(colision.get_normal().rotated((colision.get_collider().get_parent().get_parent().position).angle_to(position + Vector2(0, 5)) * -3))
			print(colision.get_collider().get_parent().get_parent())
		else:
			vel = velocity.bounce(colision.get_normal())
			if colision.get_collider().has_method("crash"):
				colision.get_collider().call("crash")
