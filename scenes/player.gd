extends CharacterBody2D

@export var animationP: Node

const SPEED = 80.0
const JUMP_VELOCITY = -400.0

func hit():
	animationP.play("attacking")
	await animationP.animation_finished
	
	queue_free()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_accept"):
		animationP.play("attacking")
		velocity.x = 0
		velocity.y = 0
	else:
		if velocity.x or velocity.y:
			animationP.play("movement")
		else:
			animationP.play("idle")
			
		if Input.is_action_pressed("ui_right"):
			velocity.x = +SPEED
			animationP.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			animationP.flip_h = true
		else:
			velocity.x = 0
			
		if Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("ui_down"):
			velocity.y = +SPEED
		else:
			velocity.y = 0

	
		
	move_and_slide()
