extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var vel = Vector2.DOWN

func _physics_process(delta):
	velocity = vel
	var colision = move_and_collide(velocity * delta * 70)
	if colision:
		print("yewa")
		vel = velocity.bounce(colision.get_normal().rotated((colision.get_collider().get_parent().get_parent().position).angle_to(position + Vector2(0, 5)) * -2))
		print(colision.get_collider().get_parent().get_parent())
