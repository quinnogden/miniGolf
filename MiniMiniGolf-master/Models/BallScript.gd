extends RigidBody

var mouseSensivity = 0.05

export var impulseForce : Vector3 = Vector3(0, 0, 1)
export var powerMultiplier : float = 0.0

onready var audio = $AudioStreamPlayer3D

var arrow
var moving = false
var maxPower = 50.0

var strokes = 0

signal hasStopped
signal powerChanged
signal strokesChanged

var arrowOgScale

func _ready():
	set_physics_process(true)
	arrow = get_child(2)
	arrowOgScale = arrow.get_scale()
	
	if (arrow.is_visible() == false):
		arrow.set_visible(true)

func _physics_process(delta):

	if get_linear_velocity() == Vector3(0, 0, 0) && get_angular_velocity() == Vector3(0, 0, 0) && moving:
		set_rotation(Vector3(0, 180, 0))
		arrow.set_scale(arrowOgScale)
		arrow.set_visible(true)
		moving = false
		emit_signal("hasStopped")
	
	if (Input.is_action_just_released("left_mouse") && moving == false && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED):
		impulseForce *= powerMultiplier
		apply_central_impulse(impulseForce)
		audio.play()
		arrow.set_visible(false)
		moving = true
		strokes += 1
		emit_signal("strokesChanged", strokes)
		emit_signal("powerChanged", 0.0)
		
func _input(event):
	#power level up and down
	if event is InputEventMouseMotion and Input.is_action_pressed("left_mouse") and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and get_angular_velocity() == Vector3(0, 0, 0):
		powerMultiplier -= event.relative.y
		powerMultiplier = clamp(powerMultiplier, 0.0, maxPower)
		arrow.set_scale(Vector3(powerMultiplier * 0.05, 0.1, 0.1))
		var powerVal = powerMultiplier / maxPower * 100
		emit_signal("powerChanged", powerVal)
	
	#aim left and right
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and get_angular_velocity() == Vector3(0, 0, 0):
		rotate_y(event.relative.x * mouseSensivity)
		impulseForce = get_global_transform().basis.z
