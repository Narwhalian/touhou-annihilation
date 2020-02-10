extends KinematicBody2D

const UP = Vector2(0, -1)
## Movement Values
var fmovement = 250
var bmovement = -200
var fallspeed = 20

var movement = Vector2()

## Movement code
func _physics_process(delta):
	
	# Right directional movement
	if Input.is_action_pressed("ui_right"):
		movement.x = fmovement
	
	if Input.is_action_just_released("ui_right"):
		movement.x = 0
	
	# Left directional movement
	if Input.is_action_pressed("ui_left"):
		movement.x = bmovement
	
	if Input.is_action_just_released("ui_left"):
		movement.x = 0
	
	# Gravity, who the hell needs gravity?
	movement.y += fallspeed
	
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			movement.y = -500
	
	move_and_slide(movement, UP)
