extends CharacterBody2D

enum MOVE {IDLE, LEFT, RIGHT, UP, DOWN}

@export var speed = 80

var move: MOVE = MOVE.IDLE

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction.x == 0 && input_direction.y == 0:
		move = MOVE.IDLE
	elif input_direction.y > 0:
		move = MOVE.DOWN
	elif input_direction.y < 0:
		move = MOVE.UP
	else:
		move = MOVE.RIGHT if input_direction.x > 0 else MOVE.LEFT
		
		
func animate():
	match move:
		MOVE.IDLE:
			$Sprite.animation = "idle"
		MOVE.UP:
			$Sprite.animation = "up"
			$Sprite.flip_h = false
		MOVE.DOWN:
			$Sprite.animation = "down"
			$Sprite.flip_h = false
		MOVE.LEFT:
			$Sprite.animation = "side"
			$Sprite.flip_h = false
		MOVE.RIGHT:
			$Sprite.animation = "side"
			$Sprite.flip_h = true

func _physics_process(_delta):
	get_input()
	animate()
	move_and_slide()
