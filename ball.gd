extends RigidBody3D

var isAlive = true
var startPosition
var startVelocity1
var startVelocity2

func _ready() -> void:
	Eventbus.dies.connect(falls)
	startPosition = position
	startVelocity1 = linear_velocity
	startVelocity2 = angular_velocity
	updateUI()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Eventbus.currentLives <= 0):
		if isAlive:
			die()
		

func die():
	Eventbus.currentLives = 0
	isAlive = false
	get_tree().change_scene_to_file.bind("res://GameOver.tscn").call_deferred()

func falls():
	if isAlive:
		Eventbus.currentLives -=1
		position = startPosition
		linear_velocity = startVelocity1
		angular_velocity = startVelocity2
		updateUI()
	
func updateUI():
	$CanvasLayer/Control/lives.text = "Lives : " + str(Eventbus.currentLives)
