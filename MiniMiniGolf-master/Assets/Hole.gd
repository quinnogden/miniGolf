extends Spatial

onready var particleEmitter = $Particles
onready var soundFx = $AudioStreamPlayer3D
onready var arrow = $holeArrow

var origPosY

func _ready():
	particleEmitter.set_emitting(false)
	origPosY = arrow.get_global_transform().basis.y
	
func _process(delta):
	var rot_speed = rad2deg(5)
	arrow.set_rotation(Vector3(0, arrow.rotation.y + rot_speed * delta, 0))

func _on_Ball_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "HoleBody":
		particleEmitter.set_emitting(true)
		soundFx.play()



func _on_AudioStreamPlayer3D_finished():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
