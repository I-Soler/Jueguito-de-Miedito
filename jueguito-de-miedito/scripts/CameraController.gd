extends Camera3D

@export var mRotSensitivity: float = 0.001
@export var mYRotLimit: float = deg_to_rad(160)
@onready var Player = $".."

func _ready():
	# Captures the mouse, leaves the cursor in the center and invisible
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		# Look right-left
		Player.rotate_y(-event.relative.x * mRotSensitivity)
		Player.rotation.y = clamp(Player.rotation.y, -mYRotLimit, mYRotLimit)
		
		# Look up-down
		rotate_x(-event.relative.y * mRotSensitivity)
		rotation.x = clamp(rotation.x, deg_to_rad(-20), deg_to_rad(60))
