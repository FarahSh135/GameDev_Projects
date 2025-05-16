extends Node3D

const MAX_X_ROTATION = 10  
const MAX_Z_ROTATION = 10 
const ROTATION_SPEED = 20   

var current_x_rotation = 0.0 
var current_z_rotation = 0.0 

var startRotation

func _ready() -> void:
	Eventbus.dies.connect(adjustPlatform)
	startRotation = rotation

func adjustPlatform() :
	rotation = startRotation
	current_x_rotation = 0.0 
	current_z_rotation = 0.0 

func _process(delta: float) -> void:
	if Input.is_action_pressed("rotate_left"):  
		try_rotate_z(ROTATION_SPEED * delta)
	elif Input.is_action_pressed("rotate_right"): 
		try_rotate_z(-ROTATION_SPEED * delta)
	
	if Input.is_action_pressed("rotate_down"):  
		try_rotate_x(ROTATION_SPEED * delta)
	elif Input.is_action_pressed("rotate_up"): 
		try_rotate_x(-ROTATION_SPEED * delta)

func try_rotate_x(amount: float):
	var new_rotation = current_x_rotation + amount
	if abs(new_rotation) <= MAX_X_ROTATION:
		rotate_object_local(Vector3(1, 0, 0), deg_to_rad(amount))
		current_x_rotation = new_rotation

func try_rotate_z(amount: float):
	var new_rotation = current_z_rotation + amount
	if abs(new_rotation) <= MAX_Z_ROTATION:
		rotate_object_local(Vector3(0, 0, 1), deg_to_rad(amount))
		current_z_rotation = new_rotation
