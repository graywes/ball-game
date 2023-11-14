extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var vel = Vector2(.5, .5)

func _physics_process(delta):
	velocity = vel
	var colision = move_and_collide(velocity * delta * 130)
	if colision:
		print("yewa")
		if colision.get_collider().is_class("AnimatableBody2D"):
			vel = velocity.bounce(colision.get_normal().rotated((colision.get_collider().get_parent().get_parent().position).angle_to(position + Vector2(0, 5)) * -2))
			print(colision.get_collider().get_parent().get_parent())
		else:
			vel = velocity.bounce(colision.get_normal())
			if colision.get_collider().has_method("crash"):
				colision.get_collider().call("crash")
