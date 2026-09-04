extends Node2D

var direction = 1
var speed = 60

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_l: RayCast2D = $RayCast_L
@onready var ray_cast_r: RayCast2D = $RayCast_R


func _process(delta):
	if ray_cast_r.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_l.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * speed * delta
