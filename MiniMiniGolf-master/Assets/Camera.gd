extends Camera

export var distance = 7.0
export var height = 4.0
signal openPopup

func _ready():
	set_physics_process(true)
	set_global_transform(get_parent().get_global_transform())
	translate(Vector3(0, 5, -5))
	rotate_x(45)
	
func _physics_process(delta):
	followBall()
	
	if get_parent().moving == true:
		set_as_toplevel(true)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#get_tree().quit()
		
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("ui_help"):
		emit_signal("openPopup")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_Ball_hasStopped():
	#followBall()
	set_as_toplevel(false)
	set_global_transform(get_parent().get_global_transform())
	translate(Vector3(0, 5, -5))
	rotate_x(45)
	
func followBall():
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3(0, 1, 0)
	
	var offset = pos - target
	
	offset = offset.normalized() * distance
	offset.y = height
	
	pos = target + offset
	
	look_at_from_position(pos, target, up)
