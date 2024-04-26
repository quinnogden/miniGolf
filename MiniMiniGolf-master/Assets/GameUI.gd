extends MarginContainer

onready var bar = $VBoxContainer/HBoxContainer2/PowerMeter
onready var centerLabel = $VBoxContainer/HBoxContainer/Label
onready var strokesLabel = $VBoxContainer/HBoxContainer2/StrokesLabel
onready var popupDialog = $PopupDialog

func _ready():
	centerLabel.set_text("")
	strokesLabel.set_text("Strokes: 0  ")

func _on_Ball_powerChanged(powerValue):
	bar.value = powerValue


func _on_Ball_strokesChanged(strokes):
	strokesLabel.set_text("Strokes: " + str(strokes))


func _on_Ball_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "HoleBody":
		centerLabel.set_text("You won")


func _on_Button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	popupDialog.hide()


func _on_Camera_openPopup():
	popupDialog.popup_centered()
