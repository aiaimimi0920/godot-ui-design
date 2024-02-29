extends Control

@export var action_list=[]:
	set(val):
		if not is_inside_tree():
			await ready
		%FullScreenDialog.action_list = val
	get:
		return %FullScreenDialog.action_list

	
@export var head_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%FullScreenDialog.head_text = val
	get:
		return %FullScreenDialog.head_text

signal trigger_action
func _on_full_screen_dialog_trigger_action(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)
