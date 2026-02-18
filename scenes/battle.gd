class_name Battle extends Control
@onready var action_menu: Panel = $"action menu"
@onready var textbox: Panel = $textbox
@onready var label: Label = $textbox/Label
@onready var run: TextureButton = $"action menu/run"

signal textbox_closed

func _on_ready() -> void:
	display_text("A Wild Dragonair appeared!")
	await textbox_closed
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and textbox.visible:
		textbox.hide()
		emit_signal("textbox_closed")
		action_menu.show()
		

func display_text(text):
	action_menu.hide()
	textbox.show()
	label.text = text
	

func _on_run_pressed() -> void:
	display_text("Got away safely!")
	await textbox_closed
	get_tree().quit()


func _on_wardrobe_pressed() -> void:
	
	pass # Replace with function body.
