extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	var Jumpin := Input.is_action_just_pressed("jump")
	var isOnFloor := is_on_floor()
	
	if Jumpin and isOnFloor:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("move_left", "move_right")
	
	#looking direction	
	if direction<0:
		animated_sprite.flip_h = true
	elif direction>0:
		animated_sprite.flip_h = false
	
	#Jump and running animations
		if  isOnFloor:
			if direction == -1:
				animated_sprite.play("Running")
			elif direction == 1:
				animated_sprite.play("Running")
			else:
				animated_sprite.play("Idle")
		else:
			animated_sprite.play("Jumping")
	
	if direction:
		velocity.x = direction * SPEED 
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
