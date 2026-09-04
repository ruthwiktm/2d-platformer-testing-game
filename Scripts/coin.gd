extends Area2D

@onready var gamemanager: Node = %GAMEMANAGER
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
	gamemanager.add_point()
	animation_player.play("new_animation")
	
