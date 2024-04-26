extends MarginContainer

onready var popup = $PopupMenu

func _on_Practice_pressed():
	#mouse mode captured means the cursor is invisible and cannot leave the game window
	#remember to set it to mouse mode visible when you want menus and whatnot 
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/PracticeCourse.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_pressed():
	popup.popup_centered()


func _on_Course1_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/Hole1.tscn")


func _on_Course2_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/Hole2.tscn")


func _on_Course3_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/Hole3.tscn")


func _on_Course4_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/Hole4.tscn")


func _on_Course5_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Levels/Hole5.tscn")


func _on_Back_pressed():
	popup.hide()
